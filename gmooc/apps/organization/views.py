from django.shortcuts import render
from django.views.generic.base import View

# Create your views here.


# 课程机构首页
class OrgListView(View):
    def get(self,request):
        return render(request,'org-list.html',{})