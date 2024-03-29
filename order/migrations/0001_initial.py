# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2019-04-23 12:31
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('user', '0001_initial'),
        ('courier', '0001_initial'),
        ('goods', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='OrderInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('add_time', models.DateTimeField(auto_now_add=True, verbose_name='添加时间')),
                ('courier', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='courier.Courier', verbose_name='快递员')),
                ('goods', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='goods.GoodsInfo', verbose_name='商品')),
                ('signer', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='user.SignerAddress', verbose_name='收件人')),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='user.User', verbose_name='发件人')),
            ],
            options={
                'db_table': 'order_info',
            },
        ),
    ]
