from datetime import datetime

from django.db import models

# Create your models here.


class CityDict(models.Model):
    name = models.CharField('城市',max_length=20)
    desc = models.CharField('描述',max_length=200)
    add_time = models.DateTimeField('添加时间',default=datetime.now)

    class Meta:
        verbose_name = '城市表'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class CourseOrg(models.Model):
    name = models.CharField('机构名称',max_length=50)
    desc = models.TextField('机构描述')
    tag = models.CharField('机构标签',max_length=10,default='全国知名')
    catgory = models.CharField('机构类别',max_length=20,choices=(("pxjg","培训机构"),("gr","个人"),("gx","高校"),),default='pxjg')
    click_nums = models.IntegerField('点击数',default=0)
    fav_nums = models.IntegerField('收藏数',default=0)
    image = models.ImageField('LOGO',upload_to='org/%Y/%m')
    address = models.CharField('机构地址',max_length=150)
    city = models.ForeignKey(CityDict,verbose_name='所在城市')
    students = models.IntegerField('学习人数',default=0)
    course_nums = models.IntegerField('课程数',default=0)
    add_time = models.DateTimeField('添加时间', default=datetime.now)

    class Meta:
        verbose_name = '课程机构'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

    def get_teachers_nums(self):
        return self.teacher_set.all().count()


class Teacher(models.Model):
    org = models.ForeignKey(CourseOrg, verbose_name='所属机构')
    name = models.CharField('教师名',max_length=50)
    age = models.IntegerField('年龄',default=20)
    work_years = models.IntegerField('工作年限',default=0)
    work_company = models.CharField('就职公司',max_length=50)
    work_position = models.CharField('公司职位',max_length=50)
    points = models.CharField('教学特点',max_length=50)
    click_nums = models.IntegerField('点击数',default=0)
    fav_nums = models.IntegerField('收藏数',default=0)
    image = models.ImageField('头像', upload_to='teacher/%Y/%m', max_length=100,null=True,blank=True)
    add_time = models.DateTimeField('添加时间', default=datetime.now)

    class Meta:
        verbose_name = '教师'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

    def get_course_nums(self):
        return self.courses_set.all().count()
