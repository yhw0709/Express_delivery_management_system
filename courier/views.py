import json
import time

from django.shortcuts import render
from django.contrib.auth.hashers import make_password, check_password
from django.http import HttpResponseRedirect, JsonResponse, HttpResponse
from django.urls import reverse

from courier.forms import CourierRegisterForm, CourierLoginForm
from courier.models import Courier, CourierReality
from order.models import OrderInfo
from user.models import SignerAddress


def courier_order_create(request):
    if request.method == 'GET':
        orders = OrderInfo.objects.filter(courier_id=None).all()
        return render(request, 'courierOrderCreate.html', {'orders': orders})


def courier_order_read(request):
    if request.method == "GET":
        courier = Courier.objects.filter(user_id=request.session['user_id']).first()
        orders = OrderInfo.objects.filter(courier_id=courier.id).all()
        return render(request, 'courierOrderRead.html', {'orders': orders})


def courier_order_history(request):
    if request.method == "GET":
        user = Courier.objects.filter(user_id=request.session['user_id']).first()
        orders = OrderInfo.objects.filter(courier_id=user.id).all().order_by('-add_time')
        return render(request, 'courierOrderHistory.html', {'orders': orders})


def courier_info(request):
    if request.method == 'GET':
        courier = Courier.objects.filter(user_id=request.session['user_id']).first()
        courier_reality = CourierReality.objects.filter(courier_id=courier.id).first()
        if courier_reality:
            return render(request, 'courierInfo.html', {'courier_reality': courier_reality, 'courier': courier})
        else:
            return render(request, 'courierInfo.html')

    if request.method == "POST":
        courier = Courier.objects.filter(user_id=request.session['user_id']).first()
        courier_reality = CourierReality.objects.filter(courier_id=courier.id).first()
        if courier_reality:
            CourierReality.objects.filter(courier_id=courier.id).update(
                real_name=request.POST.get('real_name'),
                gender=request.POST.get('gender'),
                id_card=request.POST.get('id_card'),
                nationality=request.POST.get('nationality'),
            )
            Courier.objects.filter(user_id=request.session['user_id']).update(
                tel=request.POST.get('tel'),
                mail=request.POST.get('mail'),
            )
        else:
            CourierReality.objects.create(
                courier=courier,
                real_name=request.POST.get('real_name'),
                gender=request.POST.get('gender'),
                id_card=request.POST.get('id_card'),
                nationality=request.POST.get('nationality'),
            )
            Courier.objects.filter(user_id=request.session['user_id']).update(
                tel=request.POST.get('tel'),
                mail=request.POST.get('mail'),
            )
            return render(request, 'courierInfo.html')


def courier_pw_set(request):
    if request.method == 'GET':
        return render(request, 'courierPW.html')
    if request.method == 'POST':
        courier = Courier.objects.filter(user_id=request.session['user_id']).first()
        if check_password(request.POST.get('old_pw'), courier.password):
            if request.POST.get('new_pw') == request.POST.get('com_new_pw'):
                Courier.objects.filter(user_id=request.session['user_id']).update(
                    password=request.POST.get('new_pw')
                )
                return HttpResponseRedirect(reverse('courier:courier_pw_set'))
            else:
                return HttpResponseRedirect(reverse('courier:courier_pw_set', {'msg': '两次密码不一致'}))
        else:
            return HttpResponseRedirect(reverse('courier:courier_pw_set', {'msg': '原密码不正确'}))


def courier_login(request):
    if request.method == 'GET':
        return render(request, 'courierLogin.html')
    if request.method == 'POST':
        form = CourierLoginForm(request.POST)
        if form.is_valid():
            user = Courier.objects.filter(username=form.cleaned_data['username']).first()
            if user:
                if not check_password(form.cleaned_data['password'], user.password):
                    msg = '密码错误！'
                    return render(request, 'courierLogin.html', {'msg': msg})
                else:
                    request.session['user_id'] = user.user_id
                    # add_goods_to_session(request)
                    return HttpResponseRedirect(reverse('home:index'))
            else:
                msg = '用户不存在'
                return render(request, 'courierLogin.html', {'msg': msg})
        else:
            return render(request, 'courierLogin.html', {'form': form})


def courier_register(request):
    if request.method == 'GET':
        return render(request, 'courierRegister.html')
    if request.method == 'POST':
        form = CourierRegisterForm(request.POST)
        if form.is_valid():
            Courier.objects.create(
                username=form.cleaned_data['username'],
                password=make_password(form.cleaned_data['password']),
                user_id='courier_'+str(int(time.time())),
            )

            return HttpResponseRedirect(reverse('courier:login'))
        else:
            msg = form.errors
            msg = str(sorted(msg.items())[0][1].as_text())
            return render(request, 'courierRegister.html', {'form': msg})


def courier_charts(request):
    if request.method == 'GET':
        return render(request, 'courierEcharts.html')


def order_detail(request, order_id):
    order = OrderInfo.objects.filter(id=order_id).first()
    return render(request, 'orderDetail.html', {'order': order})


def order_add(request, order_id):
    order = OrderInfo.objects.filter(id=order_id).first()
    courier = Courier.objects.filter(user_id=request.session['user_id']).first()
    order.courier = courier
    order.save()
    return JsonResponse({'code': 200, 'msg': '请求成功'})


def get_echarts(request):
    if request.method == 'GET':
        # user = User.objects.filter(user_id=request.session['user_id']).first()
        courier = Courier.objects.filter(user_id=request.session['user_id']).first()
        orders = OrderInfo.objects.filter(courier_id=courier.id).all()
        content = {}
        area = []
        area_count = []
        signer_ids = []
        for order in orders:
            signer = SignerAddress.objects.filter(id=order.signer_id).first()
            area.append(signer.province)
            signer_ids.append(order.signer_id)
        area_set = list(set(area))
        for a_s in area_set:
            area_count.append(len(SignerAddress.objects.filter(id__in=signer_ids, province=a_s).all()))
        content['area'] = area_set
        content['area_count'] = area_count
        # c = json.dumps(content)
        # d = JsonResponse(content)
        return HttpResponse(json.dumps(content, ensure_ascii=False), content_type="application/json,charset=utf-8")


