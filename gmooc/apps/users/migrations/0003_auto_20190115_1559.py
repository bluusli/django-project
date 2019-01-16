# -*- coding: utf-8 -*-
# Generated by Django 1.11.8 on 2019-01-15 15:59
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0002_banner_emailverifyrecord'),
    ]

    operations = [
        migrations.AlterField(
            model_name='emailverifyrecord',
            name='send_type',
            field=models.IntegerField(choices=[(1, '注册'), (2, '找回密码')], default=1, verbose_name='验证码类型'),
        ),
    ]
