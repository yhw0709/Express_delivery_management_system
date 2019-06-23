from django.db import models


class User(models.Model):
    """
    用户模型
    """
    user_id = models.CharField(max_length=20, verbose_name='用户id')
    username = models.CharField(max_length=20, unique=True, null=False, verbose_name='用户名')
    password = models.CharField(max_length=255, null=False, verbose_name='密码')
    mail = models.EmailField(max_length=100, null=True, blank=True, verbose_name='邮箱')
    role = models.CharField(max_length=3, verbose_name='用户', default='3')

    class Meta:
        db_table = 'user'


class UserAddress(models.Model):
    """
    用户地址信息模型
    姓名、电话、住址
    """
    # on_delete
    # 当User表中的数据被删除时，UserAddress表中对应的数据也一并删除，
    user = models.ForeignKey(User, verbose_name='用户', on_delete=models.CASCADE)
    province = models.CharField(max_length=100, default='', verbose_name='省份')
    city = models.CharField(max_length=100, default='', verbose_name='城市')
    district = models.CharField(max_length=100, default='', verbose_name='区域')
    address = models.CharField(max_length=100, default='', verbose_name='详细地址')
    user_name = models.CharField(max_length=20, default='', verbose_name='签收人')
    user_mobile = models.CharField(max_length=11, default='', verbose_name='电话')

    class Meta:
        db_table = 'user_address'


class SignerAddress(models.Model):
    """
    签收者地址信息模型
    姓名、电话、住址
    """
    # on_delete
    # 当User表中的数据被删除时，UserAddress表中对应的数据也一并删除，
    user = models.ForeignKey(User, verbose_name='用户', on_delete=models.CASCADE)
    province = models.CharField(max_length=100, default='', verbose_name='省份')
    city = models.CharField(max_length=100, default='', verbose_name='城市')
    district = models.CharField(max_length=100, default='', verbose_name='区域')
    address = models.CharField(max_length=100, default='', verbose_name='详细地址')
    signer_name = models.CharField(max_length=20, default='', verbose_name='签收人')
    signer_mobile = models.CharField(max_length=11, default='', verbose_name='电话')

    class Meta:
        db_table = 'signer_address'
