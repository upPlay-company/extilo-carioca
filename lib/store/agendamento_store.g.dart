// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agendamento_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AgendamentoStore on _AgendamentoStore, Store {
  final _$_AgendamentoStoreActionController =
      ActionController(name: '_AgendamentoStore');

  @override
  void setAll(
      {List<Servicos> servico,
      List<Product> product,
      List<Profissionais> profissionais}) {
    final _$actionInfo = _$_AgendamentoStoreActionController.startAction(
        name: '_AgendamentoStore.setAll');
    try {
      return super.setAll(
          servico: servico, product: product, profissionais: profissionais);
    } finally {
      _$_AgendamentoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
