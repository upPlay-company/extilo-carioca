// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pesquisa_satisfacao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PesquisaSatisfacaoStore on _PesquisaSatisfacaoStore, Store {
  Computed<Function> _$sendPressedComputed;

  @override
  Function get sendPressed =>
      (_$sendPressedComputed ??= Computed<Function>(() => super.sendPressed,
              name: '_PesquisaSatisfacaoStore.sendPressed'))
          .value;

  final _$servicoAtom = Atom(name: '_PesquisaSatisfacaoStore.servico');

  @override
  String get servico {
    _$servicoAtom.reportRead();
    return super.servico;
  }

  @override
  set servico(String value) {
    _$servicoAtom.reportWrite(value, super.servico, () {
      super.servico = value;
    });
  }

  final _$servicoIdAtom = Atom(name: '_PesquisaSatisfacaoStore.servicoId');

  @override
  String get servicoId {
    _$servicoIdAtom.reportRead();
    return super.servicoId;
  }

  @override
  set servicoId(String value) {
    _$servicoIdAtom.reportWrite(value, super.servicoId, () {
      super.servicoId = value;
    });
  }

  final _$profissionalAtom =
      Atom(name: '_PesquisaSatisfacaoStore.profissional');

  @override
  String get profissional {
    _$profissionalAtom.reportRead();
    return super.profissional;
  }

  @override
  set profissional(String value) {
    _$profissionalAtom.reportWrite(value, super.profissional, () {
      super.profissional = value;
    });
  }

  final _$horaAtom = Atom(name: '_PesquisaSatisfacaoStore.hora');

  @override
  int get hora {
    _$horaAtom.reportRead();
    return super.hora;
  }

  @override
  set hora(int value) {
    _$horaAtom.reportWrite(value, super.hora, () {
      super.hora = value;
    });
  }

  final _$minutosAtom = Atom(name: '_PesquisaSatisfacaoStore.minutos');

  @override
  int get minutos {
    _$minutosAtom.reportRead();
    return super.minutos;
  }

  @override
  set minutos(int value) {
    _$minutosAtom.reportWrite(value, super.minutos, () {
      super.minutos = value;
    });
  }

  final _$dateAtom = Atom(name: '_PesquisaSatisfacaoStore.date');

  @override
  Timestamp get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(Timestamp value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
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

  final _$showErrorsAtom = Atom(name: '_PesquisaSatisfacaoStore.showErrors');

  @override
  bool get showErrors {
    _$showErrorsAtom.reportRead();
    return super.showErrors;
  }

  @override
  set showErrors(bool value) {
    _$showErrorsAtom.reportWrite(value, super.showErrors, () {
      super.showErrors = value;
    });
  }

  final _$errorAtom = Atom(name: '_PesquisaSatisfacaoStore.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

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

  final _$saveAdAtom = Atom(name: '_PesquisaSatisfacaoStore.saveAd');

  @override
  bool get saveAd {
    _$saveAdAtom.reportRead();
    return super.saveAd;
  }

  @override
  set saveAd(bool value) {
    _$saveAdAtom.reportWrite(value, super.saveAd, () {
      super.saveAd = value;
    });
  }

  final _$_sendAsyncAction = AsyncAction('_PesquisaSatisfacaoStore._send');

  @override
  Future<void> _send() {
    return _$_sendAsyncAction.run(() => super._send());
  }

  final _$_PesquisaSatisfacaoStoreActionController =
      ActionController(name: '_PesquisaSatisfacaoStore');

  @override
  void setServico(String value) {
    final _$actionInfo = _$_PesquisaSatisfacaoStoreActionController.startAction(
        name: '_PesquisaSatisfacaoStore.setServico');
    try {
      return super.setServico(value);
    } finally {
      _$_PesquisaSatisfacaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setServicoId(String value) {
    final _$actionInfo = _$_PesquisaSatisfacaoStoreActionController.startAction(
        name: '_PesquisaSatisfacaoStore.setServicoId');
    try {
      return super.setServicoId(value);
    } finally {
      _$_PesquisaSatisfacaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProfissional(String value) {
    final _$actionInfo = _$_PesquisaSatisfacaoStoreActionController.startAction(
        name: '_PesquisaSatisfacaoStore.setProfissional');
    try {
      return super.setProfissional(value);
    } finally {
      _$_PesquisaSatisfacaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHora(int value) {
    final _$actionInfo = _$_PesquisaSatisfacaoStoreActionController.startAction(
        name: '_PesquisaSatisfacaoStore.setHora');
    try {
      return super.setHora(value);
    } finally {
      _$_PesquisaSatisfacaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMinutos(int value) {
    final _$actionInfo = _$_PesquisaSatisfacaoStoreActionController.startAction(
        name: '_PesquisaSatisfacaoStore.setMinutos');
    try {
      return super.setMinutos(value);
    } finally {
      _$_PesquisaSatisfacaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDate(Timestamp value) {
    final _$actionInfo = _$_PesquisaSatisfacaoStoreActionController.startAction(
        name: '_PesquisaSatisfacaoStore.setDate');
    try {
      return super.setDate(value);
    } finally {
      _$_PesquisaSatisfacaoStoreActionController.endAction(_$actionInfo);
    }
  }

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
servico: ${servico},
servicoId: ${servicoId},
profissional: ${profissional},
hora: ${hora},
minutos: ${minutos},
date: ${date},
hideQualidadeServico: ${hideQualidadeServico},
hideQualidadeAtendimento: ${hideQualidadeAtendimento},
hideTempoAtendimento: ${hideTempoAtendimento},
showErrors: ${showErrors},
error: ${error},
loading: ${loading},
saveAd: ${saveAd},
sendPressed: ${sendPressed}
    ''';
  }
}
