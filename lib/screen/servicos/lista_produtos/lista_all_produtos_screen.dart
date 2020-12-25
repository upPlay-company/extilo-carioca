import 'package:extilo_carioca/model/produtos/product_manager.dart';
import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/product_list_tile.dart';

class ListAllProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return styleScreenPattern(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            iconTheme: new IconThemeData(color: Colors.black),
            title: Text('PRODUTOS',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Principal'
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 3, left: 10, right: 10),
            child: Consumer<ProductManager>(
              builder: (_, productManager, __){
                return ListView.builder(
                  itemCount: productManager.product.length,
                  itemBuilder: (_, index){
                    return ProductListTile(productManager.product[index]);
                  },
                );
              },
            ),
          )
      ),
    );
  }
}
