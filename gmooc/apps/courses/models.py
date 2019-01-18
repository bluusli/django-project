from datetime import datetime

from django.db import models
from organization.models import CourseOrg

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
    degree = models.IntegerField('课程难度',choices=COUR_CHOICES,default=1)
    learn_time = models.IntegerField('学习时长(分钟数)',default=0)
    students = models.IntegerField('学习人数',default=0)
    fav_nums = models.IntegerField('收藏人数',default=0)
    image = models.ImageField('封面图',upload_to='courses/%Y/%m',max_length=100)
    click_nums = models.IntegerField('点击数',default=0)
    add_time = models.DateTimeField('添加时间',default=datetime.now)

    class Meta:
        verbose_name = '课程'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class Lesson(models.Model):
    course = models.ForeignKey(Courses,verbose_name='课程')
    name = models.CharField('章节名称',max_length=100)
    add_time = models.DateTimeField('添加时间',default=datetime.now)

    class Meta:
        verbose_name = '章节'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class Video(models.Model):
    lesson = models.ForeignKey(Lesson,verbose_name='章节')
    name = models.CharField('视频名称',max_length=100)
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
