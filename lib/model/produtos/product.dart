import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

import 'item_size.dart';

class Product extends ChangeNotifier {
  Product({this.img}) {
    img = img ?? [];
  }

  Product.fromDocument(DocumentSnapshot document) {
    id = document.id;
    name = document.data()['name'] as String;
    description = document.data()['description'] as String;
    img = List<String>.from(document.data()['img'] as List<dynamic>);
    quantidade = document.data()['quantidade'];
    price = document.data()['price'];
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  DocumentReference get firestoreRef => firestore.doc('produtos/$id');
  get storageRef => storage.ref().child('produtos/$id');

  String id, name, description, quantidade;
  List<String> img;
  num price;

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value){
    _loading = value;
    notifyListeners();
  }

  ItemSize _selectSize;
  ItemSize get selectedSize => _selectSize;
  set selectedSize(ItemSize value){
    _selectSize = value;
    notifyListeners();
  }

  @override
  String toString() {
    return 'Product{id: $id, name: $name, description: $description, quantidade: $quantidade, img: $img, price: $price}';
  }
}
