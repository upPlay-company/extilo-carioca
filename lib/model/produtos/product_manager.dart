import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extilo_carioca/model/produtos/product.dart';
import 'package:flutter/cupertino.dart';

class ProductManager extends ChangeNotifier {

  ProductManager(){
    _loadProduct();
  }

  List<Product> _product = [];

  String _search = '';

  String get search => _search;
  set search(String value){
    _search = value;
    notifyListeners();
  }

  bool editing = false;
  bool loading = false;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Product> get filteredProducts {
    final List<Product> filteredProducts = [];

    if(search.isEmpty){
      filteredProducts.addAll(_product);
    } else {
      filteredProducts.addAll(
          _product.where((p) => p.name.toLowerCase().contains(search.toLowerCase()))
      );
    }

    return filteredProducts;
  }

  Future<void> _loadProduct() async {
    final QuerySnapshot snapProduct =
    await firestore.collection('produtos').get();

    _product = snapProduct.docs.map(
            (p) => Product.fromDocument(p)).toList();
    notifyListeners();
  }

  Product findProductByID(String id){
    try {
      return _product.firstWhere((p) => p.id == id);
    } catch (e){
      return null;
    }
  }

  List<Product> get product {
    return _product;
  }
}