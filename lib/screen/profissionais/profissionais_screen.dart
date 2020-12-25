import 'package:extilo_carioca/model/profissionais/profissionais_manager.dart';
import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/profissionais_list_tile.dart';

class ProfissionaisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return styleScreenPattern(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            iconTheme: new IconThemeData(color: Colors.black),
            title: Text('PROFISSIONAIS',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Principal'
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        body: Padding(
          padding: const EdgeInsets.only(top: 3, left: 10, right: 10),
          child: Consumer<ProfissionaisManager>(
            builder: (_, profissinaisManager, __){
              return ListView.builder(
                itemCount: profissinaisManager.profissionais.length,
                itemBuilder: (_, index){
                  return ProfissionaisListTile(profissinaisManager.profissionais[index]);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
