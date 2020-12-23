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
                      Text(servicos.duracao,
                        style: TextStyle(
                            fontSize: 14,
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
