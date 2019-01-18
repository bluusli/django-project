from django.conf.urls import url

from .views import OrgListView,AddUserAskView,OrgHomeView,OrgCourseView,OrgDescView,OrgTeachersView,AddFavView

urlpatterns = [
    # 课程机构首页url
    url(r'^list/$', OrgListView.as_view(), name='org_list'),
    url(r'^add_ask/$',AddUserAskView.as_view(),name="add_ask"),
    url(r'^home/(?P<org_id>\d+)/$', OrgHomeView.as_view(), name="org_home"),
    url(r'^course/(?P<org_id>\d+)/$', OrgCourseView.as_view(), name="org_course"),
    url(r'^desc/(?P<org_id>\d+)/$', OrgDescView.as_view(), name="org_desc"),
    url(r'^teachers/(?P<org_id>\d+)/$', OrgTeachersView.as_view(), name="org_teachers"),

    # 机构收藏
    url(r'^add_ask/$',AddUserAskView.as_view(),name="add_ask"),
    url(r'^add_fav/$', AddFavView.as_view(), name="add_fav"),

]