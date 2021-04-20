
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extilo_carioca/model/agendamento/agendamentos.dart';
import 'package:mobx/mobx.dart';

part 'list_agendamentos_store.g.dart';

class ListAgendamentoStore = _ListAgendamentoStore with _$ListAgendamentoStore;

abstract class _ListAgendamentoStore with Store {

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  _ListAgendamentoStore(){
    _loadListAgendamentos();
  }

  @observable
  List<Schedule> allSchedules = [];

  Schedule schedule;

  @action
  void setSchedules(List<Schedule> schedule){
    allSchedules.clear();
    allSchedules.addAll(schedule);
  }

  Future<void> _loadListAgendamentos() async {
    try {
      final queryBuilder = firestore.collection('schedules').get();

      final response = await queryBuilder;

      final schedules = response.docs.map((e) => Schedule.fromDocument(e)).toList();

      setSchedules(schedules);

    } catch (e){
      print(e);
    }
  }

}