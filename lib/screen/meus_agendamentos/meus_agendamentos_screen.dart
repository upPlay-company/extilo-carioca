import 'package:extilo_carioca/common/drawer/custom_drawer.dart';
import 'package:extilo_carioca/common/empty_card.dart';
import 'package:extilo_carioca/model/agendamento/agendamento_manager.dart';
import 'package:extilo_carioca/screen/servicos/lista_produtos/lista_all_produtos_screen.dart';
import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/order_tile.dart';

class MeusAgendamentosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return styleScreenPattern(
      child: Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.transparent,
                padding: const EdgeInsets.only(left: 35),
                child: SizedBox(
                  height: 44,
                  width: 180,
                  child: FloatingActionButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => ListAllProduct()));
                    },
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Comprar Produtos',
                      overflow: TextOverflow.ellipsis,
                      style:
                      TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Meus Agendamentos', style: TextStyle(color: Colors.black),),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        body: Consumer<AgendamentosManager>(
          builder: (_, agendamentoManager, __){
            if(agendamentoManager.schedule.isEmpty){
              return EmptyCard(
                title: 'Nenhum Agendamento encontrado!',
                iconData: Icons.border_clear,
              );
            }
            return ListView.builder(
              itemCount: agendamentoManager.schedule.length,
              itemBuilder: (_, index){
                return OrderTile(
                    agendamentoManager.schedule.reversed.toList()[index]
                );
              },
            );
          },
        ),
        endDrawer: CustomDrawer(),
      ),
    );
  }
}
