# -*- coding: utf-8 -*-
# Generated by Django 1.11.8 on 2019-01-15 15:59
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='lesson',
            options={'verbose_name': '章节', 'verbose_name_plural': '章节'},
        ),
        migrations.AlterModelOptions(
            name='video',
            options={'verbose_name': '视频', 'verbose_name_plural': '视频'},
        ),
    ]
