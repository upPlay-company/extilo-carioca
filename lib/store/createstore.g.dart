// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'createstore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateStore on _CreateStore, Store {
  final _$servicosAtom = Atom(name: '_CreateStore.servicos');

  @override
  Servicos get servicos {
    _$servicosAtom.reportRead();
    return super.servicos;
  }

  @override
  set servicos(Servicos value) {
    _$servicosAtom.reportWrite(value, super.servicos, () {
      super.servicos = value;
    });
  }

  final _$profissionaisAtom = Atom(name: '_CreateStore.profissionais');

  @override
  Profissionais get profissionais {
    _$profissionaisAtom.reportRead();
    return super.profissionais;
  }

  @override
  set profissionais(Profissionais value) {
    _$profissionaisAtom.reportWrite(value, super.profissionais, () {
      super.profissionais = value;
    });
  }

  final _$productAtom = Atom(name: '_CreateStore.product');

  @override
  Product get product {
    _$productAtom.reportRead();
    return super.product;
  }

  @override
  set product(Product value) {
    _$productAtom.reportWrite(value, super.product, () {
      super.product = value;
    });
  }

  final _$_CreateStoreActionController = ActionController(name: '_CreateStore');

  @override
  void setProduct(Product value) {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.setProduct');
    try {
      return super.setProduct(value);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProfissional(Profissionais value) {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.setProfissional');
    try {
      return super.setProfissional(value);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setServicos(Servicos value) {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.setServicos');
    try {
      return super.setServicos(value);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
servicos: ${servicos},
profissionais: ${profissionais},
product: ${product}
    ''';
  }
}
