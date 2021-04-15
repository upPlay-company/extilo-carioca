import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extilo_carioca/model/order_produtos/order_produtos.dart';
import 'package:extilo_carioca/model/user/user.dart';
import 'package:flutter/cupertino.dart';

class OrdersManager extends ChangeNotifier {

  UserUser user;

  List<OrderProducts> orders = [];

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  StreamSubscription _subscription;

  void updateUser(UserUser user){
    this.user = user;
    orders.clear();

    _subscription?.cancel();
    if(user != null){
      _listenToOrders();
    }
  }

  void _listenToOrders(){
    _subscription = firestore.collection('orders')
        .where('user', isEqualTo: user.id)
        .snapshots().listen((event) {
      orders.clear();
      for(final doc in event.docs){
        orders.add(OrderProducts.fromDocument(doc));
      }
      notifyListeners();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }

}