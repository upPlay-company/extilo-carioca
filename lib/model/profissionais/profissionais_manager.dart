import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extilo_carioca/model/profissionais/profissionais.dart';
import 'package:flutter/cupertino.dart';

class ProfissionaisManager extends ChangeNotifier {
  ProfissionaisManager() {
    loadProfissionais();
  }

  List<Profissionais> _profissionais = [];

  bool editing = false;
  bool loading = false;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> loadProfissionais() async {
    final QuerySnapshot snapPro =
        await firestore.collection('profissionais').get();

    _profissionais =
        snapPro.docs.map((p) => Profissionais.fromDocument(p)).toList();
    notifyListeners();
  }

  List<Profissionais> get profissionais {
    return _profissionais;
  }
}
