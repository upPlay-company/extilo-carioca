import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extilo_carioca/model/produtos/product.dart';
import 'package:flutter/cupertino.dart';

class ProductManager extends ChangeNotifier {

  ProductManager(){
    _loadProduct();
  }

  List<Product> _product = [];

  bool editing = false;
  bool loading = false;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> _loadProduct() async {
    final QuerySnapshot snapProduct =
    await firestore.collection('produtos').get();

    _product = snapProduct.docs.map(
            (p) => Product.fromDocument(p)).toList();
    notifyListeners();
  }

  List<Product> get product {
    return _product;
  }

}