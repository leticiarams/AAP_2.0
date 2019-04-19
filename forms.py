from django.forms import ModelForm
from aaptercsem.models import *

class PerfilForm(ModelForm):
    class Meta:
        model = Perfil
        fields = ['id_perfil', 'nome_perfil']
        labels = {
            'id_perfil':'Cód.',
            'nome_perfil':'Nome'
        }
################# Letícia Ramos##########################3
class CursoForm(ModelForm):
    class Meta:
        model = Curso
        fields = ['id_curso','nome_curso','coordenador_curso']
        labels = {'id_curso': 'Código do Curso',
                  'nome_curso': 'Nome do Curso',
                  'coordenador_curso': 'Coordernador do Curso'}