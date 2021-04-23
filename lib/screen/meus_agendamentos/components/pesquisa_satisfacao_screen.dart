import 'package:extilo_carioca/model/agendamento/agendamentos.dart';
import 'package:extilo_carioca/store/pesquisa_satisfacao_store.dart';
import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class PesquisaSatisfacaoScreen extends StatefulWidget {
  PesquisaSatisfacaoScreen({this.schedule});

  final Schedule schedule;

  @override
  _PesquisaSatisfacaoScreenState createState() => _PesquisaSatisfacaoScreenState(schedule);
}

class _PesquisaSatisfacaoScreenState extends State<PesquisaSatisfacaoScreen> {

  _PesquisaSatisfacaoScreenState(Schedule schedule)
      : editing = schedule != null,
       pesquisaSatisfacaoStore = PesquisaSatisfacaoStore(schedule: schedule ?? Schedule());

  final PesquisaSatisfacaoStore pesquisaSatisfacaoStore;

  bool editing;

  @override
  void initState() {
    super.initState();

    when((_) => pesquisaSatisfacaoStore.saveAd, () {
      Navigator.of(context).pop(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return styleScreenPattern(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'Pesquisa de satisfação',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Observer(builder: (_){
          if(pesquisaSatisfacaoStore.loading)
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Salvando Avaliação',
                          style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).primaryColor),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(
                              Theme.of(context).primaryColor),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          else
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Serviço: ${widget.schedule.serviceName}',
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w500)),
                              Text('Profissional: ${widget.schedule.nameEmployee}',
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w500)),
                              Text("Hora: ${widget.schedule.hour}:${widget.schedule.minutos}0 Hs",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w500)),
                              Text(
                                  "Data: ${widget.schedule.DateBanco.toDate().day}/${widget.schedule.DateBanco.toDate().month}/${widget.schedule.DateBanco.toDate().year}",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w500))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text('Qualidade no serviço',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        Observer(builder: (_) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Radio(
                                  value: 1,
                                  onChanged: pesquisaSatisfacaoStore
                                      .setHideQualidadeServico,
                                  groupValue:
                                  pesquisaSatisfacaoStore.hideQualidadeServico,
                                  activeColor: Theme.of(context).primaryColor,
                                ),
                                Text('1'),
                                Radio(
                                  value: 2,
                                  onChanged: pesquisaSatisfacaoStore
                                      .setHideQualidadeServico,
                                  groupValue:
                                  pesquisaSatisfacaoStore.hideQualidadeServico,
                                  activeColor: Theme.of(context).primaryColor,
                                ),
                                Text('2'),
                                Radio(
                                  value: 3,
                                  onChanged: pesquisaSatisfacaoStore
                                      .setHideQualidadeServico,
                                  groupValue:
                                  pesquisaSatisfacaoStore.hideQualidadeServico,
                                  activeColor: Theme.of(context).primaryColor,
                                ),
                                Text('3'),
                                Radio(
                                  value: 4,
                                  onChanged: pesquisaSatisfacaoStore
                                      .setHideQualidadeServico,
                                  groupValue:
                                  pesquisaSatisfacaoStore.hideQualidadeServico,
                                  activeColor: Theme.of(context).primaryColor,
                                ),
                                Text('4'),
                                Radio(
                                  value: 5,
                                  onChanged: pesquisaSatisfacaoStore
                                      .setHideQualidadeServico,
                                  groupValue:
                                  pesquisaSatisfacaoStore.hideQualidadeServico,
                                  activeColor: Theme.of(context).primaryColor,
                                ),
                                Text('5')
                              ],
                            ),
                          );
                        }),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Qualidade no atendimento',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        Observer(builder: (_) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Radio(
                                  value: 1,
                                  onChanged: pesquisaSatisfacaoStore
                                      .setHideQualidadeAtendimento,
                                  groupValue: pesquisaSatisfacaoStore
                                      .hideQualidadeAtendimento,
                                  activeColor: Theme.of(context).primaryColor,
                                ),
                                Text('1'),
                                Radio(
                                  value: 2,
                                  onChanged: pesquisaSatisfacaoStore
                                      .setHideQualidadeAtendimento,
                                  groupValue: pesquisaSatisfacaoStore
                                      .hideQualidadeAtendimento,
                                  activeColor: Theme.of(context).primaryColor,
                                ),
                                Text('2'),
                                Radio(
                                  value: 3,
                                  onChanged: pesquisaSatisfacaoStore
                                      .setHideQualidadeAtendimento,
                                  groupValue: pesquisaSatisfacaoStore
                                      .hideQualidadeAtendimento,
                                  activeColor: Theme.of(context).primaryColor,
                                ),
                                Text('3'),
                                Radio(
                                  value: 4,
                                  onChanged: pesquisaSatisfacaoStore
                                      .setHideQualidadeAtendimento,
                                  groupValue: pesquisaSatisfacaoStore
                                      .hideQualidadeAtendimento,
                                  activeColor: Theme.of(context).primaryColor,
                                ),
                                Text('4'),
                                Radio(
                                  value: 5,
                                  onChanged: pesquisaSatisfacaoStore
                                      .setHideQualidadeAtendimento,
                                  groupValue: pesquisaSatisfacaoStore
                                      .hideQualidadeAtendimento,
                                  activeColor: Theme.of(context).primaryColor,
                                ),
                                Text('5')
                              ],
                            ),
                          );
                        }),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Tempo no atendimento',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        Observer(builder: (_) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Radio(
                                  value: 1,
                                  onChanged: pesquisaSatisfacaoStore
                                      .setHideTempoAtendimento,
                                  groupValue:
                                  pesquisaSatisfacaoStore.hideTempoAtendimento,
                                  activeColor: Theme.of(context).primaryColor,
                                ),
                                Text('1'),
                                Radio(
                                  value: 2,
                                  onChanged: pesquisaSatisfacaoStore
                                      .setHideTempoAtendimento,
                                  groupValue:
                                  pesquisaSatisfacaoStore.hideTempoAtendimento,
                                  activeColor: Theme.of(context).primaryColor,
                                ),
                                Text('2'),
                                Radio(
                                  value: 3,
                                  onChanged: pesquisaSatisfacaoStore
                                      .setHideTempoAtendimento,
                                  groupValue:
                                  pesquisaSatisfacaoStore.hideTempoAtendimento,
                                  activeColor: Theme.of(context).primaryColor,
                                ),
                                Text('3'),
                                Radio(
                                  value: 4,
                                  onChanged: pesquisaSatisfacaoStore
                                      .setHideTempoAtendimento,
                                  groupValue:
                                  pesquisaSatisfacaoStore.hideTempoAtendimento,
                                  activeColor: Theme.of(context).primaryColor,
                                ),
                                Text('4'),
                                Radio(
                                  value: 5,
                                  onChanged: pesquisaSatisfacaoStore
                                      .setHideTempoAtendimento,
                                  groupValue:
                                  pesquisaSatisfacaoStore.hideTempoAtendimento,
                                  activeColor: Theme.of(context).primaryColor,
                                ),
                                Text('5')
                              ],
                            ),
                          );
                        }),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: SizedBox(
                              height: 44,
                              width: 200,
                              child: Observer(builder: (_) {
                                return ElevatedButton(
                                  onPressed: pesquisaSatisfacaoStore.sendPressed,
                                  child: Text(
                                    'Enviar',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: Theme.of(context).primaryColor),
                                );
                              })),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
        }),
      ),
    );
  }
}
