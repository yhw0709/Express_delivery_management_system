import json

from django.contrib.auth.hashers import make_password, check_password
from django.http import HttpResponseRedirect, JsonResponse, HttpResponse
from django.shortcuts import render
from django.urls import reverse

from courier.models import Courier, CourierReality
from order.models import OrderInfo
from ruler.models import Ruler
from user.models import User, UserAddress, SignerAddress


def ruler_login(request):
    if request.method == 'GET':
        return render(request, 'rulerLogin.html')
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        ruler = Ruler.objects.filter(username=username).first()
        if ruler:
            if not check_password(password, ruler.password):
                msg = '密码错误！'
                return render(request, 'rulerLogin.html', {'msg': msg})
            else:
                request.session['user_id'] = ruler.user_id
                return HttpResponseRedirect(reverse('home:index'))
        else:
            msg = '用户不存在'
            return render(request, 'rulerLogin.html', {'msg': msg})


def ruler_register(request):
    if request.method == 'GET':
        Ruler.objects.create(
            username='wuyufeng',
            password=make_password('123456'),
            user_id='rtx2080ti',
        )
        return HttpResponseRedirect(reverse('ruler:login'))


def ruler_user_read(request):
    if request.method == "GET":
        users = User.objects.all()
        return render(request, 'rulerUserRead.html', {'users': users})


def ruler_courier_read(request):
    if request.method == 'GET':
        couriers = Courier.objects.all()
        return render(request, 'rulerCourierRead.html', {'couriers': couriers})


def ruler_user_order_read(request):
    if request.method == 'GET':
        orders = OrderInfo.objects.all()
        return render(request, 'rulerUserOrderRead.html', {'orders': orders})


def ruler_courier_order_read(request):
    if request.method == 'GET':
        couriers = Courier.objects.all()
        couriers_id = []
        for courier in couriers:
            couriers_id.append(courier.id)
        orders = OrderInfo.objects.filter(courier_id__in=couriers_id).all()
        return render(request, 'rulerCourierOrderRead.html', {'orders': orders})


def ruler_charts(request):
    if request.method == 'GET':
        return render(request, 'rulerEcharts.html')


def user_order_search(request):
    if request.method == "GET":
        sender_name = request.GET.get('senderName')
        if sender_name:
            sender = User.objects.filter(username=sender_name).first()
            orders = OrderInfo.objects.filter(user_id=sender.id).all()
            return render(request, 'rulerUserOrderRead.html', {'orders': orders})
        else:
            orders = OrderInfo.objects.all()
            return render(request, 'rulerUserOrderRead.html', {'orders': orders})


def courier_order_search(request):
    if request.method == "GET":
        courier_name = request.GET.get('courierName')
        if courier_name:
            courier = Courier.objects.filter(username=courier_name).first()
            orders = OrderInfo.objects.filter(courier_id=courier.id).all()
            return render(request, 'rulerCourierOrderRead.html', {'orders': orders})
        else:
            couriers = Courier.objects.all()
            couriers_id = []
            for courier in couriers:
                couriers_id.append(courier.id)
            orders = OrderInfo.objects.filter(courier_id__in=couriers_id).all()
            return render(request, 'rulerCourierOrderRead.html', {'orders': orders})


def user_detail(request, id):
    user = User.objects.filter(id=id).first()
    user_address = UserAddress.objects.filter(user_id=user.id).first()
    return render(request, 'userDetail.html', {'user_address': user_address})


def user_del(request, id):
    User.objects.filter(id=id).delete()
    return JsonResponse({'code': 200, 'msg': '请求成功'})


def courier_detail(request, id):
    courier = Courier.objects.filter(id=id).first()
    courier_reality = CourierReality.objects.filter(courier_id=courier.id).first()
    return render(request, 'courierDetail.html', {'courier_reality': courier_reality})


def courier_del(request, id):
    Courier.objects.filter(id=id).delete()
    return JsonResponse({'code': 200, 'msg': '请求成功'})


def get_echarts(request):
    if request.method == 'GET':
        user_num = [None,]
        user_num.append(len(User.objects.all()))
        courier_num = [len(Courier.objects.all()), None]
        orders = OrderInfo.objects.all()
        content = {}
        area1 = ['快递员', '普通用户']
        area = []
        area_count = [None, None]
        signer_ids = []
        for order in orders:
            signer = SignerAddress.objects.filter(id=order.signer_id).first()
            area.append(signer.province)
            signer_ids.append(order.signer_id)
        area_set = list(set(area))
        for a_s in area_set:
            area_count.append(len(SignerAddress.objects.filter(id__in=signer_ids, province=a_s).all()))
            area1.append(a_s)
        content['area'] = area1
        content['area_count'] = area_count
        content['user_num'] = user_num
        content['courier_num'] = courier_num
        return HttpResponse(json.dumps(content, ensure_ascii=False), content_type="application/json,charset=utf-8")
