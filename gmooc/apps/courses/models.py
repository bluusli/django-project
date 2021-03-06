from datetime import datetime

from django.db import models
from organization.models import CourseOrg,Teacher

# Create your models here.
COUR_CHOICES = (
    (1,'初级'),
    (2,'中级'),
    (3,'高级'),
)


class Courses(models.Model):
    course_org = models.ForeignKey(CourseOrg,verbose_name='课程机构',null=True,blank=True)
    name = models.CharField('课程名称',max_length=50)
    desc = models.CharField('课程描述',max_length=300)
    detail = models.TextField('课程详情')
    is_banner = models.BooleanField('是否轮播',default=False)
    teacher = models.ForeignKey(Teacher,verbose_name='授课讲师',null=True,blank=True)
    degree = models.IntegerField('课程难度',choices=COUR_CHOICES,default=1)
    learn_time = models.IntegerField('学习时长(分钟数)',default=0)
    students = models.IntegerField('学习人数',default=0)
    fav_nums = models.IntegerField('收藏人数',default=0)
    image = models.ImageField('封面图',upload_to='courses/%Y/%m',max_length=100)
    click_nums = models.IntegerField('点击数',default=0)
    category = models.CharField('课程类别',max_length=20,default='后端开发')
    tag = models.CharField('课程标签',max_length=10,default='')
    youneed_know = models.CharField('课程须知',max_length=300,default='')
    teacher_tell = models.CharField('老师告诉你',max_length=300,default='')
    add_time = models.DateTimeField('添加时间',default=datetime.now)

    class Meta:
        verbose_name = '课程'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

    # 获取章节数
    def get_zj_nums(self):
        return self.lesson_set.all().count()

    def get_learn_users(self):
        return self.usercourse_set.all()[:5]

    def get_course_lesson(self):
        # 获取课程所有章节
        return self.lesson_set.all()


class Lesson(models.Model):
    course = models.ForeignKey(Courses,verbose_name='课程')
    name = models.CharField('章节名称',max_length=100)
    add_time = models.DateTimeField('添加时间',default=datetime.now)

    class Meta:
        verbose_name = '章节'
        verbose_name_plural = verbose_name

    def get_lesson_video(self):
        # 获取章节所有视频
        return self.video_set.all()

    def __str__(self):
        return self.name


class Video(models.Model):
    lesson = models.ForeignKey(Lesson,verbose_name='章节')
    name = models.CharField('视频名称',max_length=100)
    url = models.CharField('访问地址',max_length=200,default="")
    learn_time = models.IntegerField('学习时长(分钟数)', default=0)
    add_time = models.DateTimeField('添加时间',default=datetime.now)

    class Meta:
        verbose_name = '视频'
        verbose_name_plural = verbose_name


class CourseResource(models.Model):
    course = models.ForeignKey(Courses,verbose_name='课程')
    name = models.CharField('名称',max_length=100)
    download = models.FileField('资源文件',upload_to='course/resource',max_length=100)
    add_time = models.DateTimeField('添加时间',default=datetime.now)

    class Meta:
        verbose_name = '课程资源'
        verbose_name_plural = verbose_name
