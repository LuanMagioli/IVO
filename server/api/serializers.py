from rest_framework import serializers

from .models import Atendimento, Card, Paciente, Preceptor, Roteiro, ElementoComunicativo


class AutenticacaoSerializer(serializers.Serializer):
    usuario = serializers.CharField()
    email = serializers.EmailField()
    senha = serializers.CharField()


class PreceptorSerializer(serializers.ModelSerializer):

    elementos_comunicativos = serializers.SerializerMethodField()

    class Meta:
        model = Preceptor
        fields = [
            'id',
            'ocupacao',
            'username',
            'email',
            'password',
            'elementos_comunicativos'
        ]
        extra_kwargs = {
            'password': {'write_only': True}
        }

    def get_elementos_comunicativos(self, obj): 
        elementos_preceptor = []
        elementos = ElementoComunicativo.objects.filter(preceptor_id=obj.id)
        for elemento in elementos:
            elementos_preceptor.append(f'http://127.0.0.1:8000/api/elementos/{elemento.id}/')
        return elementos_preceptor


class ElementoComunicativoSerializer(serializers.ModelSerializer):

    class Meta:
        model = ElementoComunicativo
        fields = [
            'id',
            'preceptor',
            'ativo',
            'texto',
            'figura',
            'libras',
            'audioDescricao',
            'data'
        ]


class CardSerializer(serializers.ModelSerializer):

    titulo = serializers.SerializerMethodField()

    descricao = serializers.SerializerMethodField()

    opcoes = serializers.SerializerMethodField()

    class Meta:
        model = Card
        fields = [
            'id',
            'ativo',
            'data',
            'titulo',
            'descricao',
            'opcoes'
        ]
        extra_kwargs = {
            'id': {'read_only': True},
            'ativo': {'read_only': True},
            'data': {'read_only': True}
        }
    
    def get_titulo(self, obj):
        elemento = ElementoComunicativo.objects.filter(id=obj.titulo_id).first()
        return f'http://127.0.0.1:8000/api/elementos/{elemento.id}/'

    def get_descricao(self, obj):
        elemento = ElementoComunicativo.objects.filter(id=obj.descricao_id).first()
        return f'http://127.0.0.1:8000/api/elementos/{elemento.id}/'

    def get_opcoes(self, obj):
        pass

    


class RoteiroSerializer(serializers.ModelSerializer):

    titulo = serializers.SerializerMethodField()

    descricao = serializers.SerializerMethodField()

    opcoes = serializers.SerializerMethodField()

    class Meta:
        model = Roteiro
        fields = [
            'id',
            'ativo',
            'titulo',
            'data',
            'descricao',
            'cards'
        ]


class PacienteSerializer(serializers.ModelSerializer):

    atendimentos = serializers.HyperlinkedRelatedField(
        many=True,
        read_only=True,
        view_name='atendimento-detail'
    )

    class Meta:
        model = Paciente
        fields = [
            'id',
            'ativo',
            'nome',
            'atendimentos'
        ]


class AtendimentoSerializer(serializers.ModelSerializer):

    class Meta:
        model = Atendimento
        fields = [
            'id',
            'texto',
            'data',
            'paciente',
            'card',
            'opcao'
        ]



