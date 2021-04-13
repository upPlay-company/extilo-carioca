import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extilo_carioca/model/user/user.dart';
import 'package:flutter/cupertino.dart';

import 'agendamentos.dart';

class AgendamentosManager extends ChangeNotifier {

  UserUser user;

  List<Schedule> schedule = [];

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  StreamSubscription _subscription;

  void updateUser(UserUser user){
    this.user = user;
    schedule.clear();

    _subscription?.cancel();
    if(user != null){
      _listenToOrders();
    }
  }

  void _listenToOrders(){
    _subscription = firestore.collection('schedules')
        .where('customerId', isEqualTo: user.id)
        .snapshots().listen((event) {
      schedule.clear();
      for(final doc in event.docs){
        schedule.add(Schedule.fromDocument(doc));
      }
      notifyListeners();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }

}