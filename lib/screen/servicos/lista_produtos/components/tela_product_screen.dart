import 'package:carousel_pro/carousel_pro.dart';
import 'package:extilo_carioca/model/produtos/product.dart';
import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TelaProductScreen extends StatelessWidget {

  TelaProductScreen(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: product,
      child: styleScreenPattern(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            iconTheme: new IconThemeData(color: Colors.black),
            title: Text(product.name,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Principal'
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Scaffold(
            backgroundColor: Colors.white,
            body: ListView(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1,
                  child: Carousel(
                    images: product.img.map((url){
                      return NetworkImage(url);
                    }).toList(),
                    dotSize: 4,
                    dotBgColor: Colors.transparent,
                    dotColor: Colors.black,
                    autoplay: false,
                    dotSpacing: 15,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        product.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'A partir de',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[600]
                          ),
                        ),
                      ),
                      Text(
                        'R\$ ${product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 8),
                        child: Text(
                          'Descrição:',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16
                          ),
                        ),
                      ),
                      Text(
                        product.description,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        height: 44,
                        child: RaisedButton(
                          onPressed: (){
                            // TODO: AÇÃO LISTA EM CARRINHO PARA COMPRA
                          },
                          color: Colors.black,
                          textColor: Colors.white,
                          child: Text(
                            'Adicionar ao Carrinho',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}