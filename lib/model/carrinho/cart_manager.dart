import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extilo_carioca/model/produtos/product.dart';
import 'package:extilo_carioca/model/user/user.dart';
import 'package:extilo_carioca/model/user/user_manager.dart';
import 'package:flutter/cupertino.dart';

import 'cart.dart';

class CartManager extends ChangeNotifier {

  List<Cart> items = [];

  UserUser user;

  num productsPrice = 0.0;

  num get totalPrice => productsPrice;

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value){
    _loading = value;
    notifyListeners();
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void updateUser(UserManager userManager){
    user = userManager.user;
    productsPrice = 0.0;
    items.clear();

    if(user != null){
      _loadCartItems();
    }
  }

  Future<void> _loadCartItems() async {
    final QuerySnapshot cartSnap = await user.cartReference.get();

    items = cartSnap.docs.map(
            (d) => Cart.fromDocument(d)..addListener(_onItemUpdate)
    ).toList();
  }

  void addToCard(Product product){
    try {
      final e = items.firstWhere((p) => p.stackable(product));
      e.increment();
    } catch (e) {
      final cartProduct = Cart.fromProduct(product);
      cartProduct.addListener(_onItemUpdate);
      items.add(cartProduct);
      user.cartReference.add(cartProduct.toCartItemMap())
          .then((doc) => cartProduct.id = doc.id);
      _onItemUpdate();
    }
    notifyListeners();
  }

  void _onItemUpdate(){
    productsPrice = 0.0;

    for(int i = 0; i<items.length; i++){
      final cartProduct = items[i];

      if(cartProduct.quantity == 0){
        removeOfCart(cartProduct);
        i--;
        continue;
      }

      notifyListeners();

      productsPrice += cartProduct.totalPrice;

      _updateCartProduct(cartProduct);

    }
  }

  void _updateCartProduct(Cart cartProduct){
    if(cartProduct.id != null)
      user.cartReference.doc(cartProduct.id).
      update(cartProduct.toCartItemMap());
  }

  void removeOfCart(Cart cartProduct){
    items.removeWhere((p) => p.id == cartProduct.id);
    user.cartReference.doc(cartProduct.id).delete();
    cartProduct.removeListener(_onItemUpdate);
    notifyListeners();
  }

  void clear(){
    for(final cartProduct in items){
      user.cartReference.doc(cartProduct.id).delete();
    }
    items.clear();
    notifyListeners();
  }

  bool get isCartValid {
    for(final cart in items){
      if(!cart.hasStock) return false;
    }
    return true;
  }

}