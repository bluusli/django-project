# -*- coding: utf-8 -*-
# Generated by Django 1.11.8 on 2019-01-22 10:56
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0006_auto_20190121_1454'),
    ]

    operations = [
        migrations.AddField(
            model_name='teacher',
            name='age',
            field=models.IntegerField(default=20, verbose_name='年龄'),
        ),
    ]