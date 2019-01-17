from django.conf.urls import url

from .views import OrgListView,AddUserAskView

urlpatterns = [
    # 课程机构首页url
    url(r'^list/$', OrgListView.as_view(), name='org_list'),
    url(r'^add_ask/$',AddUserAskView.as_view(),name="add_ask")
]