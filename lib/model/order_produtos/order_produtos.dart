import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extilo_carioca/model/carrinho/cart.dart';
import 'package:extilo_carioca/model/carrinho/cart_manager.dart';

class OrderProducts {

  OrderProducts.fromCartManager(CartManager cartManager){
    items = List.from(cartManager.items);
    price = cartManager.totalPrice;
    userId = cartManager.user.id;
  }

  OrderProducts.fromDocument(DocumentSnapshot doc){
    orderId = doc.id;
    items = (doc.data()['items'] as List<dynamic>).map((e) {
      return Cart.fromMap(e as Map<String, dynamic>);
    }).toList();
    price = doc.data()['price'] as num;
    userId = doc.data()['user'] as String;
    date = doc.data()['date'] as Timestamp;
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> save() async {
    firestore.collection('orders').doc(orderId).set(
        {
          'items': items.map((e) => e.toOrderItemMap()).toList(),
          'price': price,
          'user': userId,
        }
    );
  }

  String orderId;

  List<Cart> items;
  num price;

  String userId;

  Timestamp date;

  String get formattedId => '#${orderId.padLeft(6, '0')}';

  @override
  String toString() {
    return 'Order{firestore: $firestore, orderId: $orderId, items: $items, price: $price, userId: $userId, date: $date}';
  }
}