import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extilo_carioca/model/agendamento/agendamentos.dart';
import 'package:extilo_carioca/model/pesquisa_satisfacao/pesquisa_satisfacao.dart';
import 'package:mobx/mobx.dart';

part 'pesquisa_satisfacao_store.g.dart';

class PesquisaSatisfacaoStore = _PesquisaSatisfacaoStore with _$PesquisaSatisfacaoStore;

abstract class _PesquisaSatisfacaoStore with Store {

  _PesquisaSatisfacaoStore({this.schedule}){
    servicoId = schedule.id;
    servico = schedule.serviceName;
    profissional = schedule.nameEmployee;
    hora = schedule.hour;
    minutos = schedule.minutos;
    date = schedule.DateBanco;
    hideQualidadeServico = schedule.qualidadeServico;
    hideQualidadeAtendimento = schedule.qualidadeAtendimento;
    hideTempoAtendimento = schedule.tempoAtendimento;
  }

  final Schedule schedule;

  @observable
  String servico;

  @action
  void setServico(String value) => servico = value;

  @observable
  String servicoId;

  @action
  void setServicoId(String value) => servico = value;

  @observable
  String profissional;

  @action
  void setProfissional(String value) => profissional = value;

  @observable
  int hora;

  @action
  void setHora(int value) => hora = value;

  @observable
  int minutos;

  @action
  void setMinutos(int value) => minutos = value;

  @observable
  Timestamp date;

  @action
  void setDate(Timestamp value) => date = value;

  @observable
  int hideQualidadeServico;

  @action
  void setHideQualidadeServico(int value) => hideQualidadeServico = value;

  @observable
  int hideQualidadeAtendimento;

  @action
  void setHideQualidadeAtendimento(int value) => hideQualidadeAtendimento = value;

  @observable
  int hideTempoAtendimento;

  @action
  void setHideTempoAtendimento(int value) => hideTempoAtendimento = value;

  @computed
  Function get sendPressed => _send;

  @observable
  bool showErrors = false;

  @observable
  String error;

  @observable
  bool loading = false;

  @observable
  bool saveAd = false;


  @action
  Future<void> _send() async {
    schedule.id = servicoId;
    schedule.serviceName = servico;
    schedule.nameEmployee = profissional;
    schedule.hour = hora;
    schedule.minutos = minutos;
    schedule.DateBanco = date;
    schedule.qualidadeServico = hideQualidadeServico;
    schedule.qualidadeAtendimento = hideQualidadeAtendimento;
    schedule.tempoAtendimento = hideTempoAtendimento;

    loading = true;
    try {
      await PesquisaSatisfacao().save(schedule);
      saveAd = true;
    }catch (e){
      error = e;
    }
    loading = false;
  }

}