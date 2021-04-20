// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_agendamentos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListAgendamentoStore on _ListAgendamentoStore, Store {
  final _$allSchedulesAtom = Atom(name: '_ListAgendamentoStore.allSchedules');

  @override
  List<Schedule> get allSchedules {
    _$allSchedulesAtom.reportRead();
    return super.allSchedules;
  }

  @override
  set allSchedules(List<Schedule> value) {
    _$allSchedulesAtom.reportWrite(value, super.allSchedules, () {
      super.allSchedules = value;
    });
  }

  final _$_ListAgendamentoStoreActionController =
      ActionController(name: '_ListAgendamentoStore');

  @override
  void setSchedules(List<Schedule> schedule) {
    final _$actionInfo = _$_ListAgendamentoStoreActionController.startAction(
        name: '_ListAgendamentoStore.setSchedules');
    try {
      return super.setSchedules(schedule);
    } finally {
      _$_ListAgendamentoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allSchedules: ${allSchedules}
    ''';
  }
}
