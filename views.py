from django.shortcuts import render
from django.template import loader

from django.http import HttpResponse

from aaptercsem.forms import PerfilForm
from aaptercsem.forms import CursoForm
from aaptercsem.models import *

def index(request):
    return render(request, 'aap/index.html')

def cad_perfil_view(request):
    
    list_perfil = Perfil.objects.all();
    context = { "list_perfil" : list_perfil }
    return render(request, 'aap/cad_perfil_view.html', context)

def cad_perfil_edt(request):
    if request.method == 'POST':
        form = PerfilForm(request.POST)
        if form.is_valid():
            msg = "Erro na operação =/"
            oPerfil = Perfil();
            oPerfil.id_perfil = form.cleaned_data['id_perfil']
            oPerfil.nome_perfil = form.cleaned_data['nome_perfil']
            oPerfil.save()
            
            if oPerfil.id_perfil != '':
                msg = "Inserido com sucesso! =)"
            context = { 
                "form" : PerfilForm(),
                "msg" : msg,       
            }
        return render(request, 'aap/cad_perfil_edt.html', context)
    else:
        form = PerfilForm()
        if request.GET.get('id_perfil') != '':
            oPefil = Perfil.objects.get(pk=request.GET.get('id_perfil'))
            form = PerfilForm(initial={'id_perfil':oPefil.id_perfil, 'nome_perfil':oPefil.nome_perfil})
        context = { "form" : form }
        return render(request, 'aap/cad_perfil_edt.html', context)

#####################################CRUD Curso - Letícia Ramos###########################################
def cad_curso_view(request):
    list_curso = Curso.objects.all();
    context = {"list_curso": list_curso}
    return render(request, 'aap/cad_curso_view.html', context)

def cad_curso_edt(request):
    if request.method == 'POST':
        form = CursoForm(request.POST)
        if form.is_valid():
            msg = "Erro na operação =/"
            oCurso = Curso();
            oCurso.id_curso = form.cleaned_data['id_curso']
            oCurso.nome_curso = form.cleaned_data['nome_curso']
            oCurso.coordenador_curso = form.cleaned_data['coordenador_curso']
            oCurso.save()

            if oCurso.id_curso != '':
                msg = "Curso inserido com sucesso! =)"
            context = {
                "form": CursoForm(),
                "msg": msg,
            }
        return render(request, 'aap/cad_curso_edt.html', context)
    else:
        form = CursoForm()
        if request.GET.get('id_curso') != '':
            oCurso = Curso.objects.get(pk=request.GET.get('id_curso'))
            form = CursoForm(initial={'id_curso': oCurso.id_curso, 'nome_curso': oCurso.nome_curso,
                                      'coordenador_curso': oCurso.coordenador_curso})
        context = {"form": form}
        return render(request, 'aap/cad_curso_edt.html', context)

##############################Fim CRUD Curso - Letícia Ramos ##############################################
def gen_grade(request):
    
    list_curso = Curso.objects.all()
    listMateria = ''
    listProfessor = ''
    lsitDisponibProf = ''
    pri_sem = list()
    seg_sem = list()
    ter_sem = list()
    quart_sem = list()
    quint_sem = list()
    sext_sem = list()
    
    pri_sem_seg = list()
    pri_sem_ter = list()
    pri_sem_quar = list()
    pri_sem_quint = list()
    pri_sem_sext = list()
    pri_sem_sab = list()
    
    for eachCurso in list_curso:
        listMateria = Materia.objects.filter(id_curso=eachCurso.id_curso).prefetch_related('id_professor')
        for eachMateria in listMateria:
            if eachMateria.semestre_materia == "1":
                pri_sem.append(eachMateria)
            elif eachMateria.semestre_materia == "2":
                seg_sem.append(eachMateria)
            elif eachMateria.semestre_materia == "3":
                ter_sem.append(eachMateria)
            elif eachMateria.semestre_materia == "4":
                quart_sem.append(eachMateria)
            elif eachMateria.semestre_materia == "5":
                quint_sem.append(eachMateria)
            else:
                sext_sem.append(eachMateria)
    oProfSeg = Professor.objects.get(pk=21)
    oProfSeg.curr_materia = Materia.objects.get(pk=38)
    
    oProfTer = Professor.objects.get(pk=9)
    oProfTer.curr_materia = Materia.objects.get(pk=15)
    
    oProfQuar = Professor.objects.get(pk=6)
    oProfQuar.curr_materia = Materia.objects.get(pk=5)
    
    oProfSext = Professor.objects.get(pk=15)
    oProfSext.curr_materia = Materia.objects.get(pk=28)
    
    pri_sem_seg.append(oProfSeg)
    pri_sem_ter.append(oProfTer)
    pri_sem_quar.append(oProfQuar)
    pri_sem_sext.append(oProfSext)
    
    pri_sem_tot = [pri_sem_seg, pri_sem_ter, pri_sem_quar, pri_sem_quint, pri_sem_sext, pri_sem_sab]
            
    context = { 
        "list_curso" : list_curso,
        "listMateria" : listMateria,
        'pri_sem_seg' : pri_sem_seg,
        'pri_sem_ter' : pri_sem_ter,
        'pri_sem_quar' : pri_sem_quar,
        'pri_sem_quint' : pri_sem_quint,
        'pri_sem_sext' : pri_sem_sext,
        'pri_sem_sab' : pri_sem_sab,
        "pri_sem_tot" : pri_sem_tot,
        "len_pri_seg" : len(pri_sem_seg),
        "len_pri_ter" : len(pri_sem_ter),
        "len_pri_quar" : len(pri_sem_quar),
        "len_pri_quint" : len(pri_sem_quint),
        "len_pri_sext" : len(pri_sem_sext),
        "len_pri_sab" : len(pri_sem_sab),
    }
    return render(request, 'aap/view_horario.html', context)

        
    
    
    
    
    