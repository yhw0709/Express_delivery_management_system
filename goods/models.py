from django.db import models

from user.models import User


class GoodsInfo(models.Model):
    """
    快递模型
    """
    # 外键
    # 字段
    user = models.ForeignKey(User, verbose_name='用户', on_delete=models.CASCADE)
    goods_id = models.CharField(max_length=20, verbose_name='货物id')
    goods_weight = models.CharField(max_length=10, null=True, verbose_name='重量')
    goods_volume = models.CharField(max_length=10, null=True, verbose_name='体积')
    goods_value = models.CharField(max_length=3, null=True, verbose_name='是否贵重')
    goods_fast = models.CharField(max_length=3, null=True, verbose_name='是否加急')

    class Meta:
        db_table = 'goods'
