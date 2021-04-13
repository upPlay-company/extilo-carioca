import 'package:extilo_carioca/common/empty_card.dart';
import 'package:extilo_carioca/common/price_card.dart';
import 'package:extilo_carioca/model/carrinho/cart_manager.dart';
import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_tile.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return styleScreenPattern(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Carrinho', style: TextStyle(color: Colors.black),),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Consumer<CartManager>(
          builder: (_, cartManager, __){
            if(cartManager.items.isEmpty){
              return EmptyCard(
                iconData: Icons.remove_shopping_cart,
                title: 'Nenhum Produto no Carrinho!',
              );
            }

            return ListView(
              children: <Widget>[
                Column(
                  children: cartManager.items.map((cartProduct) =>
                      CartTile(cartProduct)).toList(),
                ),
                PriceCard(
                  buttonText: 'Continuar para pagamento',
                  onPressed: cartManager.isCartValid ? (){
                    Navigator.of(context).pushNamed('/checkout');
                  } : null,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
