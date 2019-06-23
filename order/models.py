from django.db import models

from courier.models import Courier
from goods.models import GoodsInfo
from user.models import User, SignerAddress


class OrderInfo(models.Model):
    """
    订单详情商品信息模型
    """
    user = models.ForeignKey(User, verbose_name='发件人', null=True, on_delete=models.CASCADE)
    goods = models.ForeignKey(GoodsInfo, verbose_name='商品', null=True, on_delete=models.CASCADE)
    courier = models.ForeignKey(Courier, verbose_name='快递员', null=True, on_delete=models.CASCADE)
    signer = models.ForeignKey(SignerAddress, verbose_name='收件人', null=True, on_delete=models.CASCADE)
    add_time = models.DateTimeField(auto_now_add=True, verbose_name='添加时间')

    class Meta:
        db_table = 'order_info'
