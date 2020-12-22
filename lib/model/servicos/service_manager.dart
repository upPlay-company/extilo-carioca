import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extilo_carioca/model/servicos/servicos.dart';
import 'package:flutter/cupertino.dart';

class ServiceManager extends ChangeNotifier {

  ServiceManager(){
    _loadServices();
  }

  List<Servicos> _servicos = [];

  bool editing = false;
  bool loading = false;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> _loadServices() async {
    final QuerySnapshot snapServicos =
    await firestore.collection('services').get();

    _servicos = snapServicos.docs.map(
            (s) => Servicos.fromDocument(s)).toList();
    notifyListeners();
  }

  List<Servicos> get servicos {
    return _servicos;
  }

}