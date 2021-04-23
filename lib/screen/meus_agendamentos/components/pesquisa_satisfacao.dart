import 'package:extilo_carioca/model/agendamento/agendamentos.dart';
import 'package:extilo_carioca/store/pesquisa_satisfacao_store.dart';
import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PesquisaSatisfacao extends StatelessWidget {

  PesquisaSatisfacao({this.schedule});

  final Schedule schedule;

  final PesquisaSatisfacaoStore pesquisaSatisfacaoStore = PesquisaSatisfacaoStore();

  @override
  Widget build(BuildContext context) {
    return styleScreenPattern(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Pesquisa de satisfação', style: TextStyle(color: Colors.black),),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Serviço: ${schedule.serviceName}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                        Text('Profissional: ${schedule.nameEmployee}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                        Text("Hora: ${schedule.hour}:${schedule.minutos}0 Hs", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                        Text("Data: ${schedule.DateBanco.toDate().day}/${schedule.DateBanco.toDate().month}/${schedule.DateBanco.toDate().year}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
                      ],
                    ),
                    SizedBox(height: 15,),
                    Text('Qualidade no serviço', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                    Observer(builder: (_){
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio(
                              value: 1,
                              onChanged: pesquisaSatisfacaoStore.setHideQualidadeServico,
                              groupValue: pesquisaSatisfacaoStore.hideQualidadeServico,
                              activeColor: Theme.of(context).primaryColor,
                            ),
                            Text('1'),
                            Radio(
                              value: 2,
                              onChanged: pesquisaSatisfacaoStore.setHideQualidadeServico,
                              groupValue: pesquisaSatisfacaoStore.hideQualidadeServico,
                              activeColor: Theme.of(context).primaryColor,
                            ),
                            Text('2'),
                            Radio(
                              value: 3,
                              onChanged: pesquisaSatisfacaoStore.setHideQualidadeServico,
                              groupValue: pesquisaSatisfacaoStore.hideQualidadeServico,
                              activeColor: Theme.of(context).primaryColor,
                            ),
                            Text('3'),
                            Radio(
                              value: 4,
                              onChanged: pesquisaSatisfacaoStore.setHideQualidadeServico,
                              groupValue: pesquisaSatisfacaoStore.hideQualidadeServico,
                              activeColor: Theme.of(context).primaryColor,
                            ),
                            Text('4'),
                            Radio(
                              value: 5,
                              onChanged: pesquisaSatisfacaoStore.setHideQualidadeServico,
                              groupValue: pesquisaSatisfacaoStore.hideQualidadeServico,
                              activeColor: Theme.of(context).primaryColor,
                            ),
                            Text('5')
                          ],
                        ),
                      );
                    }),
                    SizedBox(height: 10,),
                    Text('Qualidade no atendimento', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                    Observer(builder: (_){
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio(
                              value: 1,
                              onChanged: pesquisaSatisfacaoStore.setHideQualidadeAtendimento,
                              groupValue: pesquisaSatisfacaoStore.hideQualidadeAtendimento,
                              activeColor: Theme.of(context).primaryColor,
                            ),
                            Text('1'),
                            Radio(
                              value: 2,
                              onChanged: pesquisaSatisfacaoStore.setHideQualidadeAtendimento,
                              groupValue: pesquisaSatisfacaoStore.hideQualidadeAtendimento,
                              activeColor: Theme.of(context).primaryColor,
                            ),
                            Text('2'),
                            Radio(
                              value: 3,
                              onChanged: pesquisaSatisfacaoStore.setHideQualidadeAtendimento,
                              groupValue: pesquisaSatisfacaoStore.hideQualidadeAtendimento,
                              activeColor: Theme.of(context).primaryColor,
                            ),
                            Text('3'),
                            Radio(
                              value: 4,
                              onChanged: pesquisaSatisfacaoStore.setHideQualidadeAtendimento,
                              groupValue: pesquisaSatisfacaoStore.hideQualidadeAtendimento,
                              activeColor: Theme.of(context).primaryColor,
                            ),
                            Text('4'),
                            Radio(
                              value: 5,
                              onChanged: pesquisaSatisfacaoStore.setHideQualidadeAtendimento,
                              groupValue: pesquisaSatisfacaoStore.hideQualidadeAtendimento,
                              activeColor: Theme.of(context).primaryColor,
                            ),
                            Text('5')
                          ],
                        ),
                      );
                    }),
                    SizedBox(height: 10,),
                    Text('Tempo no atendimento', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                    Observer(builder: (_){
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio(
                              value: 1,
                              onChanged: pesquisaSatisfacaoStore.setHideTempoAtendimento,
                              groupValue: pesquisaSatisfacaoStore.hideTempoAtendimento,
                              activeColor: Theme.of(context).primaryColor,
                            ),
                            Text('1'),
                            Radio(
                              value: 2,
                              onChanged: pesquisaSatisfacaoStore.setHideTempoAtendimento,
                              groupValue: pesquisaSatisfacaoStore.hideTempoAtendimento,
                              activeColor: Theme.of(context).primaryColor,
                            ),
                            Text('2'),
                            Radio(
                              value: 3,
                              onChanged: pesquisaSatisfacaoStore.setHideTempoAtendimento,
                              groupValue: pesquisaSatisfacaoStore.hideTempoAtendimento,
                              activeColor: Theme.of(context).primaryColor,
                            ),
                            Text('3'),
                            Radio(
                              value: 4,
                              onChanged: pesquisaSatisfacaoStore.setHideTempoAtendimento,
                              groupValue: pesquisaSatisfacaoStore.hideTempoAtendimento,
                              activeColor: Theme.of(context).primaryColor,
                            ),
                            Text('4'),
                            Radio(
                              value: 5,
                              onChanged: pesquisaSatisfacaoStore.setHideTempoAtendimento,
                              groupValue: pesquisaSatisfacaoStore.hideTempoAtendimento,
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
                        child: ElevatedButton(
                            onPressed: (){},
                            child: Text('Enviar', style: TextStyle(fontSize: 16),),
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).primaryColor
                            ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
