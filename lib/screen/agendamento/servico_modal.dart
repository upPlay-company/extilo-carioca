import 'package:extilo_carioca/model/servicos/servicos.dart';
import 'package:extilo_carioca/store/agendamento_store.dart';
import 'package:extilo_carioca/store/createstore.dart';
import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

String teste;

class ServiceModal extends StatelessWidget {
  ServiceModal({this.selected, this.createStore});

  final AgendamentoStore agendamentoStore = GetIt.I<AgendamentoStore>();
  final CreateStore createStore;

  final Servicos selected;

  @override
  Widget build(BuildContext context) {
    return styleScreenPattern(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            iconTheme: new IconThemeData(color: Colors.black),
            title: Text(
              'SERVIÇOS',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Principal'),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 3, left: 10, right: 10),
            child: ListView.separated(
                itemBuilder: (_, index) {
                  final servList = agendamentoStore.servicosList[index];
                  final fontStyle = TextStyle(
                      fontSize: 17,
                      fontWeight: servList.id == selected?.id
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontFamily: 'Principal');
                  return InkWell(
                    splashColor: Colors.blueGrey[200],
                    onTap: () {
                      Navigator.of(context).pop(servList);
                    },
                    child: Card(
                      color: Colors.white70,
                      elevation: 15.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color:
                              servList.id == selected?.id ? Colors.blue : null,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(servList.name, style: fontStyle),
                                      Row(
                                        children: [
                                          Text(
                                            'Tempo: ',
                                            style: fontStyle,
                                          ),
                                          Text(
                                            servList.duracao,
                                            style: fontStyle,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 10, top: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'A parti de:',
                                        style: fontStyle,
                                      ),
                                      Text(
                                        'R\$${servList.price.toStringAsFixed(2)}',
                                        style: fontStyle,
                                      )
                                    ],
                                  ),
                                ),
                              ],
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
                itemCount: agendamentoStore.servicosList.length),
          )),
    );
  }
}
