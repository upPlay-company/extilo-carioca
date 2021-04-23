// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pesquisa_satisfacao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PesquisaSatisfacaoStore on _PesquisaSatisfacaoStore, Store {
  final _$loadingAtom = Atom(name: '_PesquisaSatisfacaoStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$hideQualidadeServicoAtom =
      Atom(name: '_PesquisaSatisfacaoStore.hideQualidadeServico');

  @override
  int get hideQualidadeServico {
    _$hideQualidadeServicoAtom.reportRead();
    return super.hideQualidadeServico;
  }

  @override
  set hideQualidadeServico(int value) {
    _$hideQualidadeServicoAtom.reportWrite(value, super.hideQualidadeServico,
        () {
      super.hideQualidadeServico = value;
    });
  }

  final _$hideQualidadeAtendimentoAtom =
      Atom(name: '_PesquisaSatisfacaoStore.hideQualidadeAtendimento');

  @override
  int get hideQualidadeAtendimento {
    _$hideQualidadeAtendimentoAtom.reportRead();
    return super.hideQualidadeAtendimento;
  }

  @override
  set hideQualidadeAtendimento(int value) {
    _$hideQualidadeAtendimentoAtom
        .reportWrite(value, super.hideQualidadeAtendimento, () {
      super.hideQualidadeAtendimento = value;
    });
  }

  final _$hideTempoAtendimentoAtom =
      Atom(name: '_PesquisaSatisfacaoStore.hideTempoAtendimento');

  @override
  int get hideTempoAtendimento {
    _$hideTempoAtendimentoAtom.reportRead();
    return super.hideTempoAtendimento;
  }

  @override
  set hideTempoAtendimento(int value) {
    _$hideTempoAtendimentoAtom.reportWrite(value, super.hideTempoAtendimento,
        () {
      super.hideTempoAtendimento = value;
    });
  }

  final _$destacarAdAsyncAction =
      AsyncAction('_PesquisaSatisfacaoStore.destacarAd');

  @override
  Future<void> destacarAd(Schedule schedule) {
    return _$destacarAdAsyncAction.run(() => super.destacarAd(schedule));
  }

  final _$_PesquisaSatisfacaoStoreActionController =
      ActionController(name: '_PesquisaSatisfacaoStore');

  @override
  void setHideQualidadeServico(int value) {
    final _$actionInfo = _$_PesquisaSatisfacaoStoreActionController.startAction(
        name: '_PesquisaSatisfacaoStore.setHideQualidadeServico');
    try {
      return super.setHideQualidadeServico(value);
    } finally {
      _$_PesquisaSatisfacaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHideQualidadeAtendimento(int value) {
    final _$actionInfo = _$_PesquisaSatisfacaoStoreActionController.startAction(
        name: '_PesquisaSatisfacaoStore.setHideQualidadeAtendimento');
    try {
      return super.setHideQualidadeAtendimento(value);
    } finally {
      _$_PesquisaSatisfacaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHideTempoAtendimento(int value) {
    final _$actionInfo = _$_PesquisaSatisfacaoStoreActionController.startAction(
        name: '_PesquisaSatisfacaoStore.setHideTempoAtendimento');
    try {
      return super.setHideTempoAtendimento(value);
    } finally {
      _$_PesquisaSatisfacaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
hideQualidadeServico: ${hideQualidadeServico},
hideQualidadeAtendimento: ${hideQualidadeAtendimento},
hideTempoAtendimento: ${hideTempoAtendimento}
    ''';
  }
}
