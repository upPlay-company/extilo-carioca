import 'package:extilo_carioca/model/page/page_manager.dart';
import 'package:extilo_carioca/screen/home/home_screen.dart';
import 'package:extilo_carioca/screen/meus_agendamentos/meus_agendamentos_screen.dart';
import 'package:extilo_carioca/screen/minhaconta/minhaconta_screen.dart';
import 'package:extilo_carioca/screen/unidades/unidades_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomeScreen(),
          MeusAgendamentosScreen(),
          Container(),
          UnidadesScreen(),
          MinhaContaScreen(),
        ],
      ),
    );
  }
}
