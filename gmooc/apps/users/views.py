import json
from django.shortcuts import render
from django.http import HttpResponse,HttpResponseRedirect
from django.contrib.auth import authenticate,login,logout
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from django.urls import reverse
from django.views.generic.base import View
from django.contrib.auth.hashers import make_password
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger

from .models import UserProfile,EmailVerifyRecord,Banner
from .forms import LoginForm,RegisterForm,ForgetForm,ModifyPwdForm,UploadImageForm,UserInfoForm
from utils.email_send import send_register_email
from utils.mixin_utils import LoginRequiredMixin
from operation.models import UserCourse,UserFavorite,UserMessage
from organization.models import CourseOrg,Teacher
from courses.models import Courses


# Create your views here.


# 邮箱验证
class ActiveUserView(View):
    def get(self,request,active_code):
        all_records = EmailVerifyRecord.objects.filter(code=active_code)
        if all_records:
            for record in all_records:
                email = record.email
                user = UserProfile.objects.get(email=email)
                user.is_active = True
                user.save()
        else:
            return HttpResponse("<script>alert('链接失效')</script>")
        return render(request,'login.html')


# 登录验证
class CustomBackend(ModelBackend):
    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(username=username)|Q(email=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None


# 注册
class RegisterView(View):
    def get(self,request):
        register_form = RegisterForm()
        return render(request,'register.html',{"register_form":register_form})

    def post(self,request):
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            user_name = request.POST.get('email', '')
            if UserProfile.objects.get(email=user_name):
                return render(request, 'register.html', {"register_form": register_form,"msg": "用户已存在!"})
            pass_word = request.POST.get("password", "")
            user_profile = UserProfile()
            user_profile.username = user_name
            user_profile.email = user_name
            user_profile.is_active = False
            user_profile.password = make_password(pass_word)
            user_profile.save()

            # 写入欢迎注册消息
            user_message = UserMessage()
            user_message.user = user_profile
            user_message.message = "欢迎注册慕学在线网"
            user_message.save()

            send_register_email(user_name,1)
            return render(request, 'login.html',{"register_form": register_form,"msg":"邮件已发送,请激活后登录!"})
        else:
            return render(request, 'register.html', {"register_form": register_form})


# 登出
class LogoutView(View):
    def get(self,request):
        logout(request)
        from django.core.urlresolvers import reverse
        return HttpResponseRedirect(reverse('index'))


# 登录
class LoginView(View):
    def get(self,request):
        return render(request, 'login.html', {})

    def post(self,request):
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            user_name = request.POST.get('username', '')
            pass_word = request.POST.get("password", "")
            user = authenticate(username=user_name, password=pass_word)
            if user is not None:
                if user.is_active:
                    login(request, user)
                    return HttpResponseRedirect(reverse('index'))
                else:
                    return render(request,'login.html',{"msg": "用户名未激活!"})
            else:
                return render(request, 'login.html', {"msg": "用户名或密码错误!"})
        else:
            return render(request, 'login.html', {"login_form":login_form})


# 找回密码
class ForgetPwdView(View):
    def get(self,request):
        forget_form = ForgetForm()
        return render(request,'forgetpwd.html',{"forget_form":forget_form})

    def post(self,request):
        forget_form = ForgetForm(request.POST)
        if forget_form.is_valid():
            email = request.POST.get('email','')
            send_register_email(email,2)
            return render(request,'login.html')
        else:
            return render(request, 'forgetpwd.html', {"forget_form": forget_form})


# 找回密码邮箱验证
class ResetView(View):
    def get(self,request,active_code):
        all_records = EmailVerifyRecord.objects.filter(code=active_code)
        if all_records:
            for record in all_records:
                email = record.email
                return render(request, 'password_reset.html',{"email":email})
        else:
            return HttpResponse("<script>alert('链接失效')</script>")
        return render(request,'login.html')


# 重置密码
class ModifyPwdView(View):
    def post(self,request):
        modify_pwd = ModifyPwdForm(request.POST)
        if modify_pwd.is_valid():
            pwd1 = request.POST.get("password1","")
            pwd2 = request.POST.get("password2", "")
            email = request.POST.get("email","")
            if pwd1 != pwd2:
                return render(request, 'password_reset.html', {"email": email,"msg":"密码不一致"})
            user = UserProfile.objects.get(email=email)
            user.password = make_password(pwd1)
            user.save()
            return render(request, 'login.html')
        else:
            email = request.POST.get("email", "")
            return render(request, 'password_reset.html', {"email": email, "modify_pwd": modify_pwd})


# 用户个人信息
class UserInfoView(LoginRequiredMixin,View):
    def get(self,request):
        return render(request,'usercenter-info.html',{})

    def post(self,request):
        user_info_form = UserInfoForm(request.POST,instance=request.user)
        if user_info_form.is_valid():
            user_info_form.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse(json.dumps(user_info_form.errors), content_type='application/json')


# 用户修改头像
class UploadImageView(LoginRequiredMixin,View):
    def post(self,request):
        image_form = UploadImageForm(request.POST,request.FILES,instance=request.user)
        if image_form.is_valid():
            image_form.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail"}', content_type='application/json')


# 个人中心修改密码
class UpdatePwdView(View):
    def post(self,request):
        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            pwd1 = request.POST.get("password1","")
            pwd2 = request.POST.get("password2", "")
            if pwd1 != pwd2:
                return HttpResponse('{"status":"fail","msg":"密码不一致"}', content_type='application/json')
            user = request.user
            user.password = make_password(pwd1)
            user.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse(json.dumps(modify_form.errors), content_type='application/json')


# 发送邮箱验证码
class SendEmailCodeView(LoginRequiredMixin,View):
    def get(self,request):
        email = request.GET.get('email','')

        if UserProfile.objects.filter(email=email):
            return HttpResponse('{"email":"邮箱已经存在"}', content_type='application/json')
        send_register_email(email, 3)
        return HttpResponse('{"status":"success"}', content_type='application/json')


# 修改个人邮箱
class UpdateEmailView(View):
    def post(self,request):
        email = request.POST.get('email','')
        code = request.POST.get('code','')

        existed_records = EmailVerifyRecord.objects.filter(email=email,code=code,send_type=3)
        if existed_records:
            user = request.user
            user.email = email
            user.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse('{"email":"验证码输入错误"}', content_type='application/json')


# 我的课程
class MyCourseView(LoginRequiredMixin,View):
    def get(self,request):
        user_courses = UserCourse.objects.filter(user=request.user)
        return render(request,'usercenter-mycourse.html',{
            'user_courses':user_courses,
        })


# 我的收藏-课程机构
class MyFavOrgView(LoginRequiredMixin,View):
    def get(self,request):
        org_list = []
        fav_orgs = UserFavorite.objects.filter(user=request.user,fav_type=2)
        for fav_org in fav_orgs:
            org_id = fav_org.fav_id
            org = CourseOrg.objects.get(id=org_id)
            org_list.append(org)
        return render(request,'usercenter-fav-org.html',{
            'org_list':org_list,
        })


# 我的收藏-授课讲师
class MyFavTeacherView(LoginRequiredMixin,View):
    def get(self,request):
        teacher_list = []
        fav_teachers = UserFavorite.objects.filter(user=request.user,fav_type=3)
        for fav_teacher in fav_teachers:
            teacher_id = fav_teacher.fav_id
            teacher = Teacher.objects.get(id=teacher_id)
            teacher_list.append(teacher)
        return render(request,'usercenter-fav-teacher.html',{
            'teacher_list':teacher_list,
        })


# 我的收藏-公开课程
class MyFavCourseView(LoginRequiredMixin,View):
    def get(self,request):
        course_list = []
        fav_courses = UserFavorite.objects.filter(user=request.user,fav_type=1)
        for fav_course in fav_courses:
            course_id = fav_course.fav_id
            course = Courses.objects.get(id=course_id)
            course_list.append(course)
        return render(request,'usercenter-fav-course.html',{
            'course_list':course_list,
        })


# 我的消息
class MyMessageView(LoginRequiredMixin,View):
    def get(self,request):
        all_message = UserMessage.objects.filter(user=request.user.id)
        for message in all_message:
            if message.has_read == False:
                message.has_read = True
                message.save()

        # 对消息进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_message, 5, request=request, )

        messages = p.page(page)
        return render(request,'usercenter-message.html',{
            'messages':messages,
        })


# 首页
class IndexView(View):
    def get(self,request):
        # 取出轮播图
        all_banners = Banner.objects.all().order_by('index')
        courses = Courses.objects.filter(is_banner=False)[:6]
        courses_banner = Courses.objects.filter(is_banner=True)[:3]
        course_orgs = CourseOrg.objects.all()[:15]

        return render(request,'index.html',{
            'all_banners':all_banners,
            'courses':courses,
            'courses_banner':courses_banner,
            'course_orgs':course_orgs,
        })


# 全局404处理函数
def page_not_found(request):
    from django.shortcuts import render_to_response
    response = render_to_response('404.html',{})
    response.status_code = 404
    return response


# 全局500处理函数
def page_error(request):
    from django.shortcuts import render_to_response
    response = render_to_response('500.html',{})
    response.status_code = 500
    return response


# 全局403处理函数
def page_not_Jurisdiction(request):
    from django.shortcuts import render_to_response
    response = render_to_response('403.html',{})
    response.status_code = 403
    return response