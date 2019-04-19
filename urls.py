from django.urls import path
from django.contrib import admin

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('cad_perfil_view', views.cad_perfil_view, name='cad_perfil_view'),
    path('cad_perfil_edt', views.cad_perfil_edt, name='cad_perfil_edt'),
    path('gen_grade', views.gen_grade, name='gen_grade'),
    path('admin/', admin.site.urls),
    #Letícia
    path('cad_curso_view',views.cad_curso_view, name='cad_curso_view'),
    path('cad_curso_edt', views.cad_curso_edt, name='cad_curso_edt')
]