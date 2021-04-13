import 'package:extilo_carioca/common/custom_icon_button.dart';
import 'package:extilo_carioca/model/carrinho/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {

  const CartTile(this.cart);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: cart,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            children: <Widget>[
              SizedBox(
                height: 80,
                width: 80,
                child: Image.network(cart.product.img.first),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        cart.product.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'Tamanho: ${cart.size}',
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ),
                      Consumer<Cart>(
                        builder: (_, cartProduct, __){
                          if(cartProduct.hasStock)
                            return Text(
                              'R\$ ${cartProduct.unitPrice.toStringAsFixed(2)}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              ),
                            );
                          else
                            return Text('Sem estoque suficiente!', style:
                            TextStyle(
                                color: Colors.red,
                                fontSize: 12
                            ),
                            );
                        },
                      )
                    ],
                  ),
                ),
              ),
              Consumer<Cart>(
                builder: (_, cartProduct, __){
                  return Column(
                    children: <Widget>[
                      CustomIconButton(
                        iconData: Icons.add,
                        color: Colors.black,
                        onTap: cartProduct.increment,
                      ),
                      Text(
                        '${cartProduct.quantity}', style: TextStyle(fontSize: 20),
                      ),
                      CustomIconButton(
                        iconData: Icons.remove,
                        color: cartProduct.quantity > 1 ?
                        Colors.black : Colors.red,
                        onTap: cartProduct.decrement,
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
