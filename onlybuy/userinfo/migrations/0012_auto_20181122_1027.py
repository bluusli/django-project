# -*- coding: utf-8 -*-
# Generated by Django 1.11.8 on 2018-11-22 02:27
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('userinfo', '0011_auto_20181112_1728'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userinfo',
            name='headp',
            field=models.ImageField(blank=True, default='/headphoto/touxiang.png', upload_to='headphoto', verbose_name='头像'),
        ),
    ]