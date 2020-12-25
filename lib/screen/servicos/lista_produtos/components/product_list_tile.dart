import 'package:extilo_carioca/model/produtos/product.dart';
import 'package:extilo_carioca/screen/servicos/lista_produtos/components/tela_product_screen.dart';
import 'package:flutter/material.dart';

class ProductListTile extends StatelessWidget {

  ProductListTile(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => TelaProductScreen(product)
        ));
      },
      child: Card(
        child: Container(
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  child: Image.network(product.img.first),
                  aspectRatio: 1,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Principal'
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      SizedBox(height: 10,),
                      Text('R\$${product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Principal'
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
