from django.db import models


class Courier(models.Model):
    """
    快递员模型
    """
    user_id = models.CharField(max_length=20, verbose_name='用户id')
    username = models.CharField(max_length=20, unique=True, null=False, verbose_name='用户名')
    password = models.CharField(max_length=255, null=False, verbose_name='密码')
    tel = models.CharField(max_length=11, null=True, blank=False, verbose_name='电话号码')
    mail = models.EmailField(max_length=100, null=True, blank=True, verbose_name='邮箱')
    role = models.CharField(max_length=3, verbose_name='快递员', default='2')

    class Meta:
        db_table = 'courier'


class CourierReality(models.Model):
    """
    快递员身份信息模型
    """
    # 外键
    courier = models.ForeignKey(Courier, verbose_name='快递员', on_delete=models.CASCADE)
    # 字段
    real_name = models.CharField(max_length=20, null=False, verbose_name='用户名')
    gender = models.CharField(max_length=6, null=False, verbose_name='性别')
    id_card = models.CharField(max_length=18, null=False, unique=True, verbose_name='身份证号码')
    nationality = models.CharField(max_length=255, null=False, verbose_name='民族')

    class Meta:
        db_table = 'courier_reality'
