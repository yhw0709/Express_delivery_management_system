from django.conf.urls import url

from courier import views

urlpatterns = [
    url('courier_order_create', views.courier_order_create, name='courier_order_create'),
    url('courier_order_read', views.courier_order_read, name='courier_order_read'),
    url('courier_order_history', views.courier_order_history, name='courier_order_history'),
    url('courier_info', views.courier_info, name='courier_info'),
    url('courier_pw_set', views.courier_pw_set, name='courier_pw_set'),
    url('login', views.courier_login, name='login'),
    url('register', views.courier_register, name='register'),
    url('courier_charts', views.courier_charts, name='courier_charts'),
    url('order_detail/(?P<order_id>\d+)/', views.order_detail, name='order_detail'),
    url('order_add/(?P<order_id>\d+)/', views.order_add, name='order_add'),
    url('get_echarts', views.get_echarts, name='get_echarts')
]
