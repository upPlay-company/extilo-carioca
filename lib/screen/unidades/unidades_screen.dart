import 'package:extilo_carioca/common/drawer/custom_drawer.dart';
import 'package:extilo_carioca/model/unidades/unidades_manager.dart';
import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/unidades_list_tile.dart';

class UnidadesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return styleScreenPattern(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          iconTheme: new IconThemeData(color: Colors.black),
          title: Text('UNIDADES',
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
          child: Consumer<UnidadesManager>(
            builder: (_, unidadesManager, __){
              return ListView.builder(
                itemCount: unidadesManager.unidades.length,
                itemBuilder: (_, index){
                  return UnidadesListTile(unidadesManager.unidades[index]);
                },
              );
            },
          ),
        ),
        endDrawer: CustomDrawer(),
      ),
    );
  }
}
