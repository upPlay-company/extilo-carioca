import 'package:extilo_carioca/model/produtos/product.dart';
import 'package:extilo_carioca/model/profissionais/profissionais.dart';
import 'package:extilo_carioca/model/servicos/servicos.dart';
import 'package:mobx/mobx.dart';

part 'createstore.g.dart';

class CreateStore = _CreateStore with _$CreateStore;

abstract class _CreateStore with Store {
  @observable
  Servicos servicos;

  @observable
  Profissionais profissionais;

  @observable
  Product product;

  @action
  void setProduct(Product value) => product = value;

  @action
  void setProfissional(Profissionais value) => profissionais = value;

  @action
  void setServicos(Servicos value) => servicos = value;
}
