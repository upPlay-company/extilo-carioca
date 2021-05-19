import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extilo_carioca/model/produtos/product.dart';
import 'package:flutter/cupertino.dart';

class Cart extends ChangeNotifier {

  Cart.fromProduct(this._product){
    productId = product.id;
    quantity = 1;
    size = product.selectedSize.name;
  }

  Cart.fromDocument(DocumentSnapshot document){
    id = document.id;
    productId = document.data()['pid'] as String;
    quantity = document.data()['quantity'] as int;
    size = document.data()['size'] as String;
    firestore.doc('produtos/$productId').get().then(
            (doc) {
          product = Product.fromDocument(doc);
        }
    );
  }

  Cart.fromMap(Map<String, dynamic> map){
    productId = map['pid'] as String;
    quantity = map['quantity'] as int;
    fixedPrice = map['fixedPrice'] as num;
    size = map['size'] as String;
    firestore.doc('produtos/$productId').get().then(
            (doc) {
          product = Product.fromDocument(doc);
        }
    );
  }


  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String id;
  String productId;
  int quantity;
  String size;

  num fixedPrice;

  Product _product;
  Product get product => _product;
  set product(Product value){
    _product = value;
    notifyListeners();
  }

  // ItemSize get itemSize{
  //   if(product == null) return null;
  //   return product.findSize(size);
  // }

  // num get unitPrice {
  //   if(product == null) return 0;
  //   return itemSize?.price ?? 0;
  // }

  // num get totalPrice => unitPrice * quantity;

  Map<String, dynamic> toCartItemMap(){
    return {
      'pid' : productId,
      'quantity' : quantity,
      'size' : size,
    };
  }

  // Map<String, dynamic> toOrderItemMap(){
  //   return {
  //     'pid' : productId,
  //     'quantity' : quantity,
  //     'size' : size,
  //     'fixedPrice': fixedPrice ?? unitPrice,
  //   };
  // }

  void increment(){
    quantity++;
    notifyListeners();
  }

  void decrement(){
    quantity--;
    notifyListeners();
  }

  bool stackable(Product product){
    return product.id == productId && product == product;
  }

  bool get hasStock {
    if(quantity == null) return false;
    return quantity >= quantity;
  }
}