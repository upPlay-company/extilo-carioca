import 'package:extilo_carioca/model/produtos/product.dart';
import 'package:extilo_carioca/store/agendamento_store.dart';
import 'package:extilo_carioca/store/createstore.dart';
import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ProductModal extends StatelessWidget {
  ProductModal({this.selected, this.createStore});

  final AgendamentoStore agendamentoStore = GetIt.I<AgendamentoStore>();
  final CreateStore createStore;
  Product selected;

  @override
  Widget build(BuildContext context) {
    return styleScreenPattern(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'PRODUTOS',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Principal',
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 3, left: 10, right: 10),
          child: ListView.separated(
              itemBuilder: (_, index) {
                final servProduct = agendamentoStore.productList[index];
                final fontStyle = TextStyle(
                  fontSize: 17,
                  fontWeight: servProduct.id == selected?.id
                      ? FontWeight.bold
                      : FontWeight.normal,
                );
                return InkWell(
                  splashColor: Colors.blueGrey[200],
                  onTap: () {
                    Navigator.of(context).pop(servProduct);
                  },
                  child: Card(
                    color: Colors.white70,
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color:
                            servProduct.id == selected?.id ? Colors.blue : null,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AspectRatio(
                              child: Image.network(servProduct.img.first),
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
                                    servProduct.name,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Principal'),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'R\$${servProduct.basePrice.toStringAsFixed(2)}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Principal'),
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
              },
              separatorBuilder: (_, __) {
                return Container();
              },
              itemCount: agendamentoStore.productList.length),
        ),
      ),
    );
  }
}
