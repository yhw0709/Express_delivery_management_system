# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2019-04-23 12:31
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('user', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='GoodsInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('goods_id', models.CharField(max_length=20, verbose_name='货物id')),
                ('goods_weight', models.CharField(max_length=10, null=True, verbose_name='重量')),
                ('goods_volume', models.CharField(max_length=10, null=True, verbose_name='体积')),
                ('goods_value', models.CharField(max_length=3, null=True, verbose_name='是否贵重')),
                ('goods_fast', models.CharField(max_length=3, null=True, verbose_name='是否加急')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='user.User', verbose_name='用户')),
            ],
            options={
                'db_table': 'goods',
            },
        ),
    ]
