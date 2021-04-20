import 'package:cloud_firestore/cloud_firestore.dart';

class Servicos {
  Servicos({this.name, this.id});

  Servicos.fromDocument(DocumentSnapshot document) {
    id = document.id;
    name = document.data()['name'] as String;
    price = document.data()['price'] as int;
    duracao = document.data()['duracao'] as String;
    description = document.data()['descricao'] as String;
    category = document.data()['categoria'] as String;
  }

  String id, duracao, name, description;
  int price;
  String category;

  @override
  String toString() {
    return 'Servicos{id: $id, duracao: $duracao, name: $name, description: $description, price: $price}';
  }
}
