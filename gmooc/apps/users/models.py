from datetime import datetime

from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.
USER_CHOICES = (
    (1,'男'),
    (2,'女'),
)
EMAIL_CHOICES = (
    (1,'注册'),
    (2,'找回密码'),
)


class UserProfile(AbstractUser):
    nick_name = models.CharField('昵称',max_length=50,default='')
    birday = models.DateField('生日',null=True,blank=True)
    gender = models.IntegerField('性别',choices=USER_CHOICES,default=1)
    address = models.CharField('地址',max_length=100,default='')
    mobile = models.CharField('手机号',max_length=11,null=True,blank=True)
    image = models.ImageField('头像',upload_to='image/%Y/%m',default='image/default.png',max_length=100)

    class Meta:
        verbose_name = '用户信息'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.username


class EmailVerifyRecord(models.Model):
    code = models.CharField('验证码',max_length=20)
    email = models.EmailField('邮箱',max_length=50)
    send_type = models.IntegerField('验证码类型',choices=EMAIL_CHOICES,default=1)
    send_time = models.DateTimeField('发送时间',default=datetime.now)

    class Meta:
        verbose_name = '邮箱验证码'
        verbose_name_plural = verbose_name

    def __str__(self):
        return '{0}({1})'.format(self.code, self.email)


class Banner(models.Model):
    title = models.CharField('图片名称',max_length=100)
    image = models.ImageField('图片',upload_to='banner/%Y/%m',max_length=100)
    url = models.URLField('访问地址',max_length=200)
    index = models.IntegerField('顺序',default=100)
    add_time = models.DateTimeField('添加时间',default=datetime.now)

    class Meta:
        verbose_name = '轮播图'
        verbose_name_plural = verbose_name
