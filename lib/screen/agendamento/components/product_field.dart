import 'package:extilo_carioca/screen/agendamento/modais/product_modal.dart';
import 'package:extilo_carioca/store/createstore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProductField extends StatelessWidget {
  ProductField(this.createStore);

  final CreateStore createStore;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return GestureDetector(
        onTap: () async {
          final product = await showDialog(
            context: context,
            builder: (_) => ProductModal(
              selected: createStore.product,
            ),
          );
          if (product != null) {
            createStore.setProduct(product);
          }
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            height: 60,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Icon(Icons.cut),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.61,
                  child: Text(
                    createStore.product == null
                        ? 'Produtos'
                        : 'Produtos: ${createStore?.product?.name}',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Principal',
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
