from django.conf.urls import url

from ruler import views

urlpatterns = [
    url('login', views.ruler_login, name='login'),
    url('ruler_register', views.ruler_register, name='ruler_register'),
    url('ruler_user_read', views.ruler_user_read, name='ruler_user_read'),
    url('ruler_courier_read', views.ruler_courier_read, name='ruler_courier_read'),
    url('user_order_search', views.user_order_search, name='user_order_search'),
    url('courier_order_search', views.courier_order_search, name='courier_order_search'),
    url('ruler_user_order_read', views.ruler_user_order_read, name='ruler_user_order_read'),
    url('ruler_courier_order_read', views.ruler_courier_order_read, name='ruler_courier_order_read'),
    url('ruler_charts', views.ruler_charts, name='ruler_charts'),
    url('get_echarts', views.get_echarts, name='get_echarts'),
    url('user_detail/(?P<id>\d+)/', views.user_detail, name='user_detail'),
    url('courier_detail/(?P<id>\d+)/', views.courier_detail, name='courier_detail'),
    url('user_del/(?P<id>\d+)/', views.user_del, name='user_del'),
    url('courier_del/(?P<id>\d+)/', views.courier_del, name='courier_del'),
]
