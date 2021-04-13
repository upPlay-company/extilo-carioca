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
    sizes = (document.data()['sizes'] as List<dynamic> ?? []).map((s)
    => ItemSize.fromMap(s as Map<String, dynamic>)).toList();
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  DocumentReference get firestoreRef => firestore.doc('produtos/$id');
  get storageRef => storage.ref().child('produtos/$id');

  String id, name, description;
  List<String> img;
  List<ItemSize> sizes;

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

  int get totalStock {
    int stock = 0;
    for(final size in sizes){
      stock += size.stock;
    }
    return stock;
  }

  bool get hasStock {
    return totalStock > 0;
  }

  num get basePrice {
    num lowest = double.infinity;
    for(final size in sizes){
      if(size.price < lowest && size.hasStock)
        lowest = size.price;
    }
    return lowest;
  }

  ItemSize findSize(String name){
    try {
      return sizes.firstWhere((s) => s.name == name);
    } catch (e){
      return null;
    }
  }

  List<Map<String, dynamic>> exportSizeList(){
    return sizes.map((size) => size.toMap()).toList();
  }

  @override
  String toString() {
    return 'Product{id: $id, name: $name, description: $description, img: $img, sizes: $sizes}';
  }
}
