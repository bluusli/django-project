from django.conf.urls import url

from .views import CourseListView


urlpatterns = [
    # 公开课
    url(r'^list/$', CourseListView.as_view(), name='course_list'),
]