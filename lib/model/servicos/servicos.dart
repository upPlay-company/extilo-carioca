import 'package:cloud_firestore/cloud_firestore.dart';

class Servicos {
  Servicos({this.name, this.id});

  Servicos.fromDocument(DocumentSnapshot document) {
    id = document.id;
    name = document.data()['name'] as String;
    price = document.data()['price'] as int;
    duracao = document.data()['duracao'] as String;
    img = List<String>.from(document.data()['img'] as List<dynamic>);
  }

  String id;
  String name;
  int price;
  String duracao;
  List<String> img;

  @override
  String toString() {
    return 'Servicos{id: $id, name: $name, price: $price, duracao: $duracao, img: $img}';
  }
}
