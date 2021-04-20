import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extilo_carioca/model/servicos/servicos.dart';
import 'package:extilo_carioca/screen/agendamento/modais/scheduling_modal.dart';
import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/material.dart';

class CategoryService extends StatelessWidget {

  final DocumentSnapshot snapshot;

  CategoryService({this.snapshot, this.selected});

  final Servicos selected;

  @override
  Widget build(BuildContext context) {
    return styleScreenPattern(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text('ESCOLHA UM SERVIÇO', style: TextStyle(color: Colors.black),),
            iconTheme: IconThemeData(size: 10, color: Colors.black),
            centerTitle: true,
          ),
          body: FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance
                .collection("categoria")
                .doc(snapshot.id)
                .collection("servicos")
                .get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else
                return ListView.builder(
                    padding: EdgeInsets.all(4.0),
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      Servicos data =
                      Servicos.fromDocument(snapshot.data.docs[index]);
                      data.category = this.snapshot.id;
                      final servList = data;
                      final fontStyle = TextStyle(
                          fontSize: 17,
                          fontWeight: servList.id == selected?.id
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontFamily: 'Principal');
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SchedulingModal(
                                  servicos: servList,
                                )),
                          );
                        },
                        child: Card(
                          color: Colors.white70,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: servList.id == selected?.id ? Colors.blue : null,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 10, top: 10),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                servList.name,
                                                style: fontStyle, softWrap: true, overflow: TextOverflow.ellipsis,
                                              ),
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
                                              ),
                                              if(servList.description != null)
                                                Text(
                                                  'Descrição: ',
                                                  style: fontStyle,
                                                ),
                                              if(servList.description != null)
                                                Text(
                                                  servList.description,
                                                  style: TextStyle(fontSize: 14), softWrap: true,
                                                )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(right: 10, top: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'A parti de:',
                                              style: fontStyle,
                                            ),
                                            Text(
                                              'R\$${servList.price.toStringAsFixed(2)}',
                                              style: fontStyle,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
            },
          )),
    );
  }
}
