from django.shortcuts import render
from django.views.generic.base import View
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse

from .models import CourseOrg,CityDict,Teacher
from operation.models import UserFavorite,Courses
from .forms import UserAskForm
# Create your views here.


# 课程机构列表功能
class OrgListView(View):
    def get(self,request):
        # 课程机构
        all_orgs = CourseOrg.objects.all()
        hot_orgs = all_orgs.order_by("-click_nums")[:3]
        # 城市列表
        all_citys = CityDict.objects.all()
        # 取出筛选城市
        city_id = request.GET.get('city', "")
        if city_id:
            all_orgs = all_orgs.filter(city_id=int(city_id))

        # 类别筛选
        category = request.GET.get('ct', "")
        if category:
            all_orgs = all_orgs.filter(catgory=category)

        sort = request.GET.get('sort', "")
        if sort:
            if sort == "students":
                all_orgs = all_orgs.order_by("-students")
            elif sort == "courses":
                all_orgs = all_orgs.order_by("-course_nums")

        org_nums = all_orgs.count()

        # 对页面进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_orgs,5, request=request,)

        orgs = p.page(page)

        return render(request,'org-list.html',{
            "all_orgs":orgs,
            "all_citys":all_citys,
            "org_nums":org_nums,
            "city_id":city_id,
            "category":category,
            "hot_orgs":hot_orgs,
            "sort":sort,
        })


# 用户添加咨询
class AddUserAskView(View):
    def post(self,request):
        userask_form = UserAskForm(request.POST)
        if userask_form.is_valid():
            user_ask = userask_form.save(commit=True)
            return HttpResponse('{"status":"success"}',content_type='application/json')
        else:
            return HttpResponse('{"status":"fail","msg":"添加出错!"}',content_type='application/json')


# 机构首页
class OrgHomeView(View):
    def get(self,request,org_id):
        current_page = "home"
        course_org = CourseOrg.objects.get(id=int(org_id))
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user,fav_id=course_org.id,fav_type=2):
                has_fav = True
        all_courses = course_org.courses_set.all()[:4]
        all_teachers = course_org.teacher_set.all()[:1]
        return render(request,'org-detail-homepage.html',{
            'all_courses':all_courses,
            'all_teachers':all_teachers,
            'course_org':course_org,
            'current_page': current_page,
            'has_fav':has_fav,
            })


# 机构课程列表页
class OrgCourseView(View):
    def get(self,request,org_id):
        current_page = "course"
        course_org = CourseOrg.objects.get(id=int(org_id))
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user,fav_id=course_org.id,fav_type=2):
                has_fav = True
        all_courses = course_org.courses_set.all()
        return render(request,'org-detail-course.html',{
            'all_courses':all_courses,
            'course_org':course_org,
            'current_page':current_page,
            'has_fav': has_fav,
            })


# 机构介绍
class OrgDescView(View):
    def get(self,request,org_id):
        current_page = "desc"
        course_org = CourseOrg.objects.get(id=int(org_id))
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user,fav_id=course_org.id,fav_type=2):
                has_fav = True
        return render(request,'org-detail-desc.html',{
            'course_org':course_org,
            'current_page':current_page,
            'has_fav': has_fav,
            })


# 机构讲师
class OrgTeachersView(View):
    def get(self,request,org_id):
        current_page = "teachers"
        course_org = CourseOrg.objects.get(id=int(org_id))
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user,fav_id=course_org.id,fav_type=2):
                has_fav = True
        all_teachers = course_org.teacher_set.all()
        return render(request,'org-detail-teachers.html',{
            'course_org':course_org,
            'all_teachers': all_teachers,
            'current_page':current_page,
            'has_fav': has_fav,
            })


# 用户收藏,以及取消收藏
class AddFavView(View):
    def post(self,request):
        fav_id = request.POST.get('fav_id',0)
        fav_type = request.POST.get('fav_type', 0)

        if not request.user.is_authenticated():
            # 判断用户登录状态
            return HttpResponse('{"status":"fail","msg":"用户未登录!"}', content_type='application/json')
        exist_records = UserFavorite.objects.filter(user=request.user,fav_id=int(fav_id),fav_type=int(fav_type))
        if exist_records:
            # 如果记录已经存在,则表示用户取消收藏
            exist_records.delete()
            return HttpResponse('{"status":"success","msg":"收藏"}', content_type='application/json')
        else:
            user_fav = UserFavorite()
            if int(fav_id) > 0 and int(fav_type) > 0:
                user_fav.user = request.user
                user_fav.fav_id = int(fav_id)
                user_fav.fav_type = int(fav_type)
                user_fav.save()
                return HttpResponse('{"status":"success","msg":"已收藏"}', content_type='application/json')
            else:
                return HttpResponse('{"status":"fail","msg":"收藏出错!"}', content_type='application/json')


# 课程讲师列表页
class TeacherListView(View):
    def get(self,request):
        all_teachers = Teacher.objects.all()

        # 讲师排行
        sorted_teacher = all_teachers.order_by("-click_nums")[:3]

        # 人气排序
        sort = request.GET.get("sort","")
        if sort:
            if sort == "hot":
                all_teachers = all_teachers.order_by("-click_nums")

        count = all_teachers.count()

        #对讲师进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_teachers, 5, request=request)

        teachers = p.page(page)

        return render(request,'teachers-list.html',{
            'all_teachers':teachers,
            'count':count,
            'sort':sort,
            'sorted_teacher':sorted_teacher,
        })


# 讲师详情页
class TeacherDetailView(View):
    def get(self,request,teacher_id):
        teachers = Teacher.objects.get(id=int(teacher_id))
        all_courses = Courses.objects.filter(teacher=teachers)

        has_teacher_faved = False
        if UserFavorite.objects.filter(user=request.user,fav_type=3,fav_id=teacher_id):
            has_teacher_faved = True

        has_org_faved = False
        if UserFavorite.objects.filter(user=request.user, fav_type=2, fav_id=teacher_id):
            has_org_faved = True

        # 讲师排行
        sorted_teacher = Teacher.objects.all().order_by("-click_nums")[:3]
        return render(request,'teacher-detail.html',{
            'teachers':teachers,
            'all_courses':all_courses,
            'sorted_teacher':sorted_teacher,
            'has_teacher_faved':has_teacher_faved,
            'has_org_faved':has_org_faved,
        })