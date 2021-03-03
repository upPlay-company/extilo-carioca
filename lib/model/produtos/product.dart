import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class Product extends ChangeNotifier {
  Product({this.img}) {
    img = img ?? [];
  }

  Product.fromDocument(DocumentSnapshot document) {
    id = document.id;
    name = document.data()['name'] as String;
    description = document.data()['description'] as String;
    img = List<String>.from(document.data()['img'] as List<dynamic>);
    price = document.data()['price'] as int;
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  DocumentReference get firestoreRef => firestore.doc('produtos/$id');
  get storageRef => storage.ref().child('produtos/$id');

  String id;
  String name;
  String description;
  List<String> img;
  int price;

  @override
  String toString() {
    return 'Product{id: $id, name: $name, description: $description, img: $img, price: $price}';
  }
}
