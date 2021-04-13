import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class UserUser extends ChangeNotifier {
  UserUser(
      {this.email,
      this.password,
      this.name,
      this.confirmPassword,
      this.id,
      this.datanasc,
      this.phone});

  UserUser.fromDocument(DocumentSnapshot document) {
    id = document.id;
    name = document.data()['name'] as String;
    email = document.data()['email'] as String;
    datanasc = document.data()['nascimento'] as String;
    phone = document.data()['phone'] as String;
    _faithfulness = document.data()['faithfulness'] as List<bool>;
  }

  String id, name, email, password, datanasc, phone, confirmPassword, newPass;
  List<bool> _faithfulness;

  List get faithfulness => _faithfulness;

  DocumentReference get firestoreRef =>
      FirebaseFirestore.instance.doc('users/$id');

  CollectionReference get cartReference =>
      firestoreRef.collection('cart');

  Future<void> saveData() async {
    await firestoreRef.set(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'nascimento': datanasc,
      'phone': phone
    };
  }

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> save() async {
    loading = true;

    final Map<String, dynamic> data = {
      'name': name,
      'email': email,
      'phone': phone,
      'nascimento': datanasc,
    };

    if (id == null) {
      final doc = await firestoreRef.collection('users').add(data);
      id = doc.id;
    } else {
      await firestoreRef.update(data);
    }

    loading = false;
  }
}
