import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extilo_carioca/model/agendamento/agendamentos.dart';
import 'package:extilo_carioca/model/user/user_manager.dart';
import 'package:get_it/get_it.dart';

class PesquisaSatisfacao {

  String id;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;


  Future<void> save(Schedule schedule) async {
    final Map<String, dynamic> data = {
      'schedules_id': schedule.id,
      'servico': schedule.serviceName,
      'profissional': schedule.nameEmployee,
      'hour': schedule.hour,
      'minutos': schedule.minutos,
      'date': schedule.DateBanco,
      'qualidade_servico': schedule.qualidadeServico,
      'qualidade_atendimento': schedule.qualidadeAtendimento,
      'tempo_atendimento': schedule.tempoAtendimento,
      'user': GetIt.I<UserManager>().user.id,
    };


    if(id == null){
      await FirebaseFirestore.instance
          .collection('pesquisa_satisfacao')
          .add(data);


      DocumentReference firestoreRef = firestore
          .collection('schedules')
          .doc(schedule.id);

      await firestoreRef.update({'avaliacao': true});
    }
  }
}