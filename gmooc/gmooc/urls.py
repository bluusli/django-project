"""gmooc URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url,include
from django.contrib import admin
from django.views.generic import TemplateView
from django.views.static import serve

from users.views import LoginView,RegisterView,ActiveUserView,ForgetPwdView,ResetView,ModifyPwdView,LogoutView
from users.views import IndexView
from gmooc.settings import MEDIA_ROOT,STATIC_ROOT

import xadmin

urlpatterns = [
    # 后台管理url
    url(r'^xadmin/', xadmin.site.urls),
    # 首页展示url
    url(r'^$',IndexView.as_view(),name='index'),
    # 登录url
    url(r'^login/$', LoginView.as_view(), name='login'),
    # 注册url
    url(r'^register/$', RegisterView.as_view(), name='register'),
    # 注册验证码url
    url(r'^captcha/', include('captcha.urls')),
    # 邮箱验证url
    url(r'^active/(?P<active_code>.*)/$',ActiveUserView.as_view(),name='user_active'),
    url(r'^reset/(?P<active_code>.*)/$',ResetView.as_view(),name='reset_pwd'),
    # 找回密码url
    url(r'^forget/$',ForgetPwdView.as_view(),name='forget_pwd'),
    url(r'^modify_pwd/$',ModifyPwdView.as_view(),name='modify_pwd'),
    # 退出登录url
    url(r'logout/$',LogoutView.as_view(),name='logout'),

    # 课程机构url配置
    url(r'^org/', include('organization.urls',namespace="org")),

    # 配置上传文件的访问处理函数
    url(r'^media/(?P<path>.*)',serve,{"document_root":MEDIA_ROOT}),

    url(r'^static/(?P<path>.*)', serve, {"document_root": STATIC_ROOT}),

    # 课程相关url配置
    url(r'^course/', include('courses.urls',namespace="course")),

    # 用户相关url配置
    url(r'^users/', include('users.urls', namespace="users")),

]

# 全局错误页面的配置
handler404 = 'users.views.page_not_found'
handler500 = 'users.views.page_error'
handler403 = 'users.views.page_not_Jurisdiction'

