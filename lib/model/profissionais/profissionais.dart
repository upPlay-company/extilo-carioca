import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Profissionais extends ChangeNotifier {
  Profissionais({this.img, this.id}) {
    img = img ?? [];
  }

  Profissionais.fromDocument(DocumentSnapshot document) {
    id = document.id;
    name = document.data()['name'] as String;
    img = List<String>.from(document.data()['img'] as List<dynamic>);
  }

  String id;
  String name;
  List<String> img;

  @override
  String toString() {
    return 'Profissionais{id: $id, name: $name, img: $img}';
  }
}
