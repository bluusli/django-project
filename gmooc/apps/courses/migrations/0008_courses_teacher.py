# -*- coding: utf-8 -*-
# Generated by Django 1.11.8 on 2019-01-21 15:26
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0006_auto_20190121_1454'),
        ('courses', '0007_video_learn_time'),
    ]

    operations = [
        migrations.AddField(
            model_name='courses',
            name='teacher',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='organization.Teacher', verbose_name='授课讲师'),
        ),
    ]
