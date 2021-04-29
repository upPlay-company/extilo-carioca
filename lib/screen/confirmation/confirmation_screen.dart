import 'package:extilo_carioca/model/order_produtos/order_produtos.dart';
import 'package:extilo_carioca/screen/orders_products/components/order_product_tile.dart';
import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmationScreen extends StatelessWidget {

  const ConfirmationScreen(this.order);

  final OrderProducts order;

  @override
  Widget build(BuildContext context) {
    return styleScreenPattern(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Card(
          margin: const EdgeInsets.all(16),
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(height: 10,),
              Center(
                child: Text(
                  'PEDIDO CONFIRMADO ${order.formattedId}',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Valor total: R\$ ${order.price.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 18
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: order.items.map((e) {
                  return OrderProductTile(e);
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor
                    ),
                    onPressed: (){
                      Navigator.of(context).popAndPushNamed('/base');
                    },
                    child: Text('Voltar para o início')
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
