import 'package:extilo_carioca/model/servicos/servicos.dart';
import 'package:flutter/material.dart';

class ServiceListTile extends StatelessWidget {

  ServiceListTile(this.servicos);

  final Servicos servicos;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 70,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(servicos.name,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Principal'
                        ),
                      ),
                      Row(
                        children: [
                          Text('Tempo: ',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Principal'
                            ),
                          ),
                          Text(servicos.duracao,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Principal'
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('A parti de:',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Principal'
                        ),
                      ),
                      Text('R\$${servicos.price.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Principal'
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
