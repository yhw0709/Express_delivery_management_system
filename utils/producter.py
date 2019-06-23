import random
import time

from django.contrib.auth.hashers import make_password

from goods.models import GoodsInfo
from order.models import OrderInfo
from user.models import User, SignerAddress


def create_orders():
    user_ids = ['user_1556023764', 'user_1556024764', 'user_1556025764']
    users = ['佩奇', '嘉哥', '珠珠']
    for index in range(3):
        User.objects.create(
            username=users[index],
            password=make_password('123456'),
            user_id=user_ids[index],
        )
    provinces = ['四川', '广东', '浙江']
    cities = ['成都', '广州', '宁波']
    districts = ['龙泉驿', '海珠', '北仑']
    addresses = ['迎晖路1080号', '杏园大街2080号', '大碶街道6324号']
    signer_names = ['张三', '李四', '王五']
    signer_mobiles = ['13258230120', '18628133324', '15289044194']

    for _ in range(20):
        province = random.choice(provinces)
        index = provinces.index(province)
        goods_values = ['on', '']
        # 获取用户信息
        user = User.objects.filter(user_id=random.choice(user_ids)).first()
        # 创建签收者对象，保存信息
        signer_address = SignerAddress()
        signer_address.user = user
        signer_address.province = province
        signer_address.city = cities[index]
        signer_address.district = districts[index]
        signer_address.address = addresses[index]
        signer_address.signer_name = signer_names[index]
        signer_address.signer_mobile = signer_mobiles[index]
        signer_address.save()

        # 创建货物对象，保存信息
        goods = GoodsInfo()
        goods.user = user
        goods.goods_id = int(time.time())
        goods.goods_weight = random.randint(10)
        goods.goods_volume = random.randint(7)
        goods.goods_value = random.choice(goods_values)
        goods.goods_fast = random.choice(goods_values)
        goods.save()

        # 创建订单对象
        order = OrderInfo()
        order.user = user
        order.signer = signer_address
        order.goods = goods

        order.save()
    return