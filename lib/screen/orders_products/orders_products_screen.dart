import 'package:extilo_carioca/common/drawer/custom_drawer.dart';
import 'package:extilo_carioca/common/empty_card.dart';
import 'package:extilo_carioca/model/order_produtos/order_manager.dart';
import 'package:extilo_carioca/screen/orders_products/components/order_tile.dart';
import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class OrdersProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return styleScreenPattern(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Meus Pedidos', style: TextStyle(color: Colors.black),),
          centerTitle: true,
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Consumer<OrdersManager>(
          builder: (_, ordersManager, __){
            if(ordersManager.orders.isEmpty){
              return EmptyCard(
                title: 'Nenhum compra encontrada!',
                iconData: Icons.border_clear,
              );
            }
            return ListView.builder(
              itemCount: ordersManager.orders.length,
              itemBuilder: (_, index){
                return OrderTile(
                    ordersManager.orders.reversed.toList()[index]
                );
              },
            );
          },
        ),
        endDrawer: CustomDrawer(),
      ),
    );
  }
}
