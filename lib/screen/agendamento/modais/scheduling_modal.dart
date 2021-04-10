import 'package:extilo_carioca/model/profissionais/profissionais.dart';
import 'package:extilo_carioca/model/servicos/servicos.dart';
import 'package:extilo_carioca/screen/calendar_barber/calendar_barber.dart';
import 'package:extilo_carioca/store/agendamento_store.dart';
import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SchedulingModal extends StatelessWidget {
  SchedulingModal({this.selected, this.servicos});

  final AgendamentoStore agendamentoStore = GetIt.I<AgendamentoStore>();

  final Profissionais selected;

  final Servicos servicos;

  @override
  Widget build(BuildContext context) {
    return styleScreenPattern(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'ESCOLHA UM BARBEIRO',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Principal'),
            ),
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 3, left: 10, right: 10),
            child: ListView.separated(
                itemBuilder: (_, index) {
                  final profList = agendamentoStore.profissionalList[index];
                  final servList = servicos;
                  print(servList);
                  final fontStyle = TextStyle(
                      fontSize: profList.id == selected?.id ? 20 : 18,
                      fontWeight: profList.id == selected?.id
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontFamily: 'Principal');
                  return InkWell(
                    splashColor: Colors.blueGrey[200],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CalendarBarber(
                                  barber: profList,
                                  servico: servList,
                                )),
                      );
                    },
                    child: Card(
                      color: Colors.white70,
                      elevation: 6.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color:
                              profList.id == selected?.id ? Colors.blue : null,
                        ),
                        height: 60,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                                right: 30,
                              ),
                              child: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(profList.img.first),
                              ),
                            ),
                            Text(
                              profList.name,
                              style: fontStyle,
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
                itemCount: agendamentoStore.profissionalList.length),
          )),
    );
  }
}
