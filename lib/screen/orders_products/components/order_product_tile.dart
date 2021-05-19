import 'package:extilo_carioca/model/carrinho/cart.dart';
import 'package:flutter/material.dart';

class OrderProductTile extends StatelessWidget {

  const OrderProductTile(this.cartProduct);

  final Cart cartProduct;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed('/product', arguments: cartProduct.product);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: Image.network(cartProduct.product.img.first),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartProduct.product.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    'Tamanho: ${cartProduct.size}',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  // Text(
                  //   'R\$ ${(cartProduct.fixedPrice ??
                  //       cartProduct.unitPrice)
                  //       .toStringAsFixed(2)}',
                  //   style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.black,
                  //       fontSize: 14
                  //   ),
                  // ),
                ],
              ),
            ),
            Text(
              '${cartProduct.quantity}',
              style: TextStyle(
                  fontSize: 20
              ),
            ),
          ],
        ),
      ),
    );
  }
}
