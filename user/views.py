import json
import random
import time

from django.contrib.auth.hashers import check_password, make_password
from django.http import HttpResponseRedirect, JsonResponse, HttpResponse
from django.shortcuts import render
from django.urls import reverse

from goods.models import GoodsInfo
from order.models import OrderInfo
from user.models import UserAddress, SignerAddress, User


def user_order_create(request):
    if request.method == 'GET':
        return render(request, 'userOrderCreate.html')
    if request.method == 'POST':
        # 获取用户信息
        user = User.objects.filter(user_id=request.session['user_id']).first()
        # 创建签收者对象，保存信息
        signer_address = SignerAddress()
        signer_address.user = user
        signer_address.province = request.POST.get('province')
        signer_address.city = request.POST.get('city')
        signer_address.district = request.POST.get('district')
        signer_address.address = request.POST.get('address')
        signer_address.signer_name = request.POST.get('signerName')
        signer_address.signer_mobile = request.POST.get('signerMobile')
        signer_address.save()

        # 创建货物对象，保存信息
        goods = GoodsInfo()
        goods.user = user
        goods.goods_id = int(time.time())
        goods.goods_weight = request.POST.get('goodsWeight')
        goods.goods_volume = request.POST.get('goodsVolume')
        goods.goods_value = request.POST.get('goodsValue')
        goods.goods_fast = request.POST.get('goodsFast')
        goods.save()

        # 创建订单对象
        order = OrderInfo()
        order.user = user
        order.signer = signer_address
        order.goods = goods

        order.save()

        return HttpResponseRedirect(reverse('user:user_order_create'))


def user_order_search(request):
    if request.method == "GET":
        signer_name = request.GET.get('signerName')
        if signer_name:
            signers = SignerAddress.objects.filter(signer_name=signer_name).all()
            ids = []
            for signer in signers:
                if signer.user.user_id == request.session['user_id']:
                    ids.append(signer.id)
            orders = OrderInfo.objects.filter(signer_id__in=ids).all()
            return render(request, 'userOrderSearch.html', {'orders': orders, 'signer_name': signer_name})
        else:
            return render(request, 'userOrderSearch.html')
    # if request.method == "POST":
    # signer_name = request.POST.get('signerName')
    # signer_id = SignerAddress.objects.filter(signer_name=signer_name).first()
    # orders = OrderInfo.objects.filter(signer_id=signer_id).all()
    # return render(request, 'userOrderSearchResult.html', {'orders': orders, 'signer_name': signer_name})
    # # return JsonResponse({'code': 200, 'orders': orders, 'signer_name': signer_name})


# def user_order_search_result(request):
#     if request.method == "GET":
#         signer_name = request.GET.get('signerName')
#         signer_id = SignerAddress.objects.filter(signer_name=signer_name).first()
#         orders = OrderInfo.objects.filter(signer_id=signer_id).all()
#         return render(request, 'userOrderSearch.html', {'orders': orders, 'signer_name': signer_name})


def user_order_history(request):
    if request.method == "GET":
        user = User.objects.filter(user_id=request.session['user_id']).first()
        orders = OrderInfo.objects.filter(user_id=user.id).all().order_by('-add_time')
        return render(request, 'userOrderHistory.html', {'orders': orders})


def user_info(request):
    if request.method == 'GET':
        # 获取用户对象
        user = User.objects.filter(user_id=request.session['user_id']).first()
        user_address = UserAddress.objects.filter(user_id=user.id).first()
        # 对象的信息存在，返回信息和页面
        if user_address:
            return render(request, 'userInfo.html', {'user_address': user_address})
        # 对象信息不存在，返回空白页面
        else:
            return render(request, 'userInfo.html')

    if request.method == 'POST':
        # 获取用户对象
        user = User.objects.filter(user_id=request.session['user_id']).first()
        # 获取用户信息对象
        user_address = UserAddress.objects.filter(user_id=user.id).first()
        # 如果信息存在，跟新
        if user_address:
            UserAddress.objects.filter(user_id=user.id).update(
                province=request.POST.get('province'),
                city=request.POST.get('city'),
                district=request.POST.get('district'),
                address=request.POST.get('address'),
                user_name=request.POST.get('userName'),
                user_mobile=request.POST.get('userMobile'),
            )
        # 不存在，创建
        else:
            UserAddress.objects.create(
                user=user,
                province=request.POST.get('province'),
                city=request.POST.get('city'),
                district=request.POST.get('district'),
                address=request.POST.get('address'),
                user_name=request.POST.get('userName'),
                user_mobile=request.POST.get('userMobile'),
            )
        return HttpResponseRedirect(reverse('user:user_info'))


def user_pw_set(request):
    if request.method == 'GET':
        return render(request, 'userPW.html')
    if request.method == 'POST':
        user = User.objects.filter(user_id=request.session['user_id']).first()
        if check_password(request.POST.get('old_pw'), user.password):
            if request.POST.get('new_pw') == request.POST.get('com_new_pw'):
                User.objects.filter(user_id=request.session['user_id']).update(
                    password=request.POST.get('new_pw')
                )
                return HttpResponseRedirect(reverse('user:user_pw_set'))
            else:
                return HttpResponseRedirect(reverse('user:user_pw_set', {'msg': '两次密码不一致'}))
        else:
            return HttpResponseRedirect(reverse('user:user_pw_set', {'msg': '原密码不正确'}))


def user_charts(request):
    if request.method == 'GET':
        return render(request, 'userEcharts.html')


def get_echarts(request):
    if request.method == 'GET':
        user = User.objects.filter(user_id=request.session['user_id']).first()
        signers = SignerAddress.objects.filter(user_id=user.id).all()
        signer_names = []
        for signer in signers:
            signer_names.append(signer.signer_name)
        signers_set = list(set(signer_names))
        goods_nums = []
        for signer in signers_set:
            goods_nums.append(len(SignerAddress.objects.filter(signer_name=signer, user_id=user.id).all()))
        content = {}
        content['singers'] = signers_set
        content['goods_nums'] = goods_nums
        # c = json.dumps(content)
        # d = JsonResponse(content)
        return HttpResponse(json.dumps(content, ensure_ascii=False), content_type="application/json,charset=utf-8")


def create_orders(request):
    if request.method == 'GET':
        user_ids = ['user_1556023764', 'user_1556024764', 'user_1556025764']
        users = ['佩奇', '嘉哥', '珠珠']
        # for index in range(3):
        #     User.objects.create(
        #         username=users[index],
        #         password=make_password('123456'),
        #         user_id=user_ids[index],
        #     )
        provinces = ['四川', '广东', '浙江', '四川', '福建', '广东', '四川']
        cities = ['成都', '广州', '宁波', '泸州', '泉州', '珠海', '德阳']
        districts = ['龙泉驿', '海珠', '北仑', '江阳', '江阴', '哈口', '什邡']
        addresses = ['迎晖路1080号', '杏园大街2080号', '大碶街道6324号', '诸子街1001号', '留下街343号', '海天321号', '回澜路12号']
        signer_names = ['张三', '李四', '王五', '杨二', '黄流', '吴奇隆', '蔡徐坤']
        signer_mobiles = ['13258230120', '18628133324', '15289044194', '12342343412', '13423233551', '18623232123',
                          '18913213132']

        for gd in range(200):
            signer_name = random.choice(signer_names)
            index = signer_names.index(signer_name)
            goods_values = ['on', '']
            # 获取用户信息
            user = User.objects.filter(user_id=random.choice(user_ids)).first()
            # 创建签收者对象，保存信息
            signer_address = SignerAddress()
            signer_address.user = user
            signer_address.province = provinces[index]
            signer_address.city = cities[index]
            signer_address.district = districts[index]
            signer_address.address = addresses[index]
            signer_address.signer_name = signer_names[index]
            signer_address.signer_mobile = signer_mobiles[index]
            signer_address.save()

            # 创建货物对象，保存信息
            goods = GoodsInfo()
            goods.user = user
            goods.goods_id = '15560247' + str(gd)
            goods.goods_weight = random.randint(1, 10)
            goods.goods_volume = random.randint(3, 7)
            goods.goods_value = random.choice(goods_values)
            goods.goods_fast = random.choice(goods_values)
            goods.save()

            # 创建订单对象
            order = OrderInfo()
            order.user = user
            order.signer = signer_address
            order.goods = goods

            order.save()
        return HttpResponseRedirect(reverse('ruler:login'))


def user_order_del(request):
    if request.method == "GET":
        SignerAddress.objects.all().delete()
        return 'success'


def order_del(request, order_id):
    if request.method == 'POST':
        order = OrderInfo.objects.filter(pk=order_id).first()
        GoodsInfo.objects.filter(id=order.goods_id).delete()
        SignerAddress.objects.filter(id=order.signer_id).delete()
        OrderInfo.objects.filter(pk=order_id).delete()
        return JsonResponse({'code': 200, 'msg': '请求成功'})
