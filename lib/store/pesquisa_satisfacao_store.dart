import 'package:extilo_carioca/model/agendamento/agendamentos.dart';
import 'package:mobx/mobx.dart';

part 'pesquisa_satisfacao_store.g.dart';

class PesquisaSatisfacaoStore = _PesquisaSatisfacaoStore with _$PesquisaSatisfacaoStore;

abstract class _PesquisaSatisfacaoStore with Store {

  @observable
  bool loading = false;

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

  @action
  Future<void> destacarAd(Schedule schedule) async {
    //schedule.hidePag = hideCard;
    loading = true;
    //await Schedule().destacar(adLojas);
  }

}