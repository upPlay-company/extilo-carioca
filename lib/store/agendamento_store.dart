import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extilo_carioca/model/produtos/product.dart';
import 'package:extilo_carioca/model/profissionais/profissionais.dart';
import 'package:extilo_carioca/model/servicos/servicos.dart';
import 'package:mobx/mobx.dart';

part 'agendamento_store.g.dart';

class AgendamentoStore = _AgendamentoStore with _$AgendamentoStore;

abstract class _AgendamentoStore with Store {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  _AgendamentoStore() {
    _loadAll();
  }

  //Listas Observable
  ObservableList<Profissionais> professionalList =
      ObservableList<Profissionais>();

  ObservableList<Product> productList = ObservableList<Product>();

  ObservableList<Servicos> servicosList = ObservableList<Servicos>();

  //Actions
/*  @action
  void setProfissional(List<Profissionais> profissional) {
    professionalList.clear();
    professionalList.addAll(profissional);
  }

  @action
  void setProduct(List<Product> product) {
    productList.clear();
    productList.addAll(product);
  }

  @action
  void setService(List<Servicos> servico) {
    servicosList.clear();
    servicosList.addAll(servico);
  }*/

  @action
  void setAll(
      {List<Servicos> servico,
      List<Product> product,
      List<Profissionais> profissionais}) {
    servicosList.clear();
    productList.clear();
    professionalList.clear();
    servicosList.addAll(servico);
    productList.addAll(product);
    professionalList.addAll(profissionais);
  }

  //Loads de funções do app
  Future<void> _loadAll() async {
    //Declarações de variaveis
    final queryBuild = await firestore.collection('profissionais').get();
    final queryBuildProduct = await firestore.collection('produtos').get();
    final queryBuildServico = await firestore.collection('servicos').get();

    //Listas de Profissionais
    final profissionais =
        queryBuild.docs.map((p) => Profissionais.fromDocument(p)).toList();
    print(profissionais);

    //Listas de Produtos
    final product =
        queryBuildProduct.docs.map((r) => Product.fromDocument(r)).toList();
    print(product);

    //Listas de Serviços
    final servico =
        queryBuildServico.docs.map((s) => Servicos.fromDocument(s)).toList();
    print(servico);

    //Função para adicionar a lista produtos
    setAll(product: product);

    //Função para adicionar a lista profissionais
    setAll(profissionais: profissionais);

    //Função para adicionar a lista servicos
    setAll(servico: servico);
  }
}
