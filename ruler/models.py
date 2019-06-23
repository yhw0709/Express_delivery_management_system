from django.db import models


class Ruler(models.Model):
    """
    管理人员模型
    """
    username = models.CharField(max_length=20, unique=True, null=False, verbose_name='用户名')
    password = models.CharField(max_length=255, null=False, verbose_name='密码')
    user_id = models.CharField(max_length=20, verbose_name='用户id')
    role = models.CharField(max_length=3, verbose_name='管理员', default='1')

    class Meta:
        db_table = 'ruler'
