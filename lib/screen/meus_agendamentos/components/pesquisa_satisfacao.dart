import 'package:extilo_carioca/model/agendamento/agendamentos.dart';
import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/material.dart';

class PesquisaSatisfacao extends StatelessWidget {

  PesquisaSatisfacao({this.schedule});

  final Schedule schedule;

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
        body: Container(),
      ),
    );
  }
}
