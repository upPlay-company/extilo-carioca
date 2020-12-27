import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extilo_carioca/model/unidades/unidades.dart';
import 'package:flutter/cupertino.dart';

class UnidadesManager extends ChangeNotifier {

  UnidadesManager(){
    _loadUnidades();
  }

  List<Unidades> _unidades = [];

  bool editing = false;
  bool loading = false;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> _loadUnidades() async {
    final QuerySnapshot snapUnidades =
    await firestore.collection('unidades').get();

    _unidades = snapUnidades.docs.map(
            (u) => Unidades.fromDocument(u)).toList();
    notifyListeners();
  }

  List<Unidades> get unidades {
    return _unidades;
  }

}