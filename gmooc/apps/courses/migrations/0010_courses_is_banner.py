# -*- coding: utf-8 -*-
# Generated by Django 1.11.8 on 2019-01-25 10:14
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0009_auto_20190121_1532'),
    ]

    operations = [
        migrations.AddField(
            model_name='courses',
            name='is_banner',
            field=models.BooleanField(default=False, verbose_name='是否轮播'),
        ),
    ]
