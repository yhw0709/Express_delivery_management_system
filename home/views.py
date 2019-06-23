import time

from django.contrib.auth.hashers import make_password, check_password
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.urls import reverse

from courier.models import Courier
from ruler.models import Ruler
from user.forms import UserRegisterForm, UserLoginForm
from user.models import User
from utils.functions import is_login


def login(request):
    if request.method == 'GET':
        return render(request, 'login.html')
    if request.method == 'POST':
        form = UserLoginForm(request.POST)
        if form.is_valid():
            user = User.objects.filter(username=form.cleaned_data['username']).first()
            if user:
                if not check_password(form.cleaned_data['password'], user.password):
                    msg = '密码错误！'
                    return render(request, 'login.html', {'msg': msg})
                else:
                    request.session['user_id'] = user.user_id
                    # add_goods_to_session(request)
                    return HttpResponseRedirect(reverse('home:index'))
            else:
                msg = '用户不存在'
                return render(request, 'login.html', {'msg': msg})
        else:
            return render(request, 'login.html', {'form': form})


def register(request):
    if request.method == 'GET':
        return render(request, 'register.html')
    if request.method == 'POST':
        form = UserRegisterForm(request.POST)
        if form.is_valid():
            User.objects.create(
                username=form.cleaned_data['username'],
                password=make_password(form.cleaned_data['password']),
                user_id='user_'+str(int(time.time())),
            )

            return HttpResponseRedirect(reverse('home:login'))
        else:
            msg = form.errors
            msg = str(sorted(msg.items())[0][1].as_text())
            return render(request, 'register.html', {'form': msg})


@is_login
def index(request):
    if request.method == 'GET':
        user = User.objects.filter(user_id=request.session['user_id']).first()
        courier = Courier.objects.filter(user_id=request.session['user_id']).first()
        ruler = Ruler.objects.filter(user_id=request.session['user_id']).first()
        if user:
            return render(request, 'index.html', {'user': user})
        if courier:
            return render(request, 'index.html', {'user': courier})
        if ruler:
            return render(request, 'index.html', {'user': ruler})


@is_login
def logout(request):
    if request.method == 'GET':
        session_key = request.session.session_key
        request.session.delete(session_key)

        return HttpResponseRedirect(reverse('home:login'))

