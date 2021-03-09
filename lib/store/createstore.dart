import 'package:extilo_carioca/model/servicos/servicos.dart';
import 'package:mobx/mobx.dart';

part 'createstore.g.dart';

class CreateStore = _CreateStore with _$CreateStore;

abstract class _CreateStore with Store {
  @observable
  Servicos servicos;

  @action
  void setServicos(Servicos value) => servicos = value;
}
