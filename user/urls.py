from django.conf.urls import url

from user import views

urlpatterns = [
    url('user_order_create', views.user_order_create, name='user_order_create'),
    url('user_order_search', views.user_order_search, name='user_order_search'),
    url('user_order_del', views.user_order_del, name='user_order_del'),
    # url('user_order_search_result/$', views.user_order_search_result, name='user_order_search_result'),
    url('user_order_history', views.user_order_history, name='user_order_history'),
    url('user_info', views.user_info, name='user_info'),
    url('user_pw_set', views.user_pw_set, name='user_pw_set'),
    url('user_charts', views.user_charts, name='user_charts'),
    url('create_orders', views.create_orders, name='create_orders'),
    url('get_echarts', views.get_echarts, name='get_echarts'),
    url('order_del/(?P<order_id>\d+)/', views.order_del, name='order_del'),
]
