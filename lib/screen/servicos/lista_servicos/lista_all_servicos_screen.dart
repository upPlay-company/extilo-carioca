import 'package:extilo_carioca/model/servicos/service_manager.dart';
import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/service_list_tile.dart';

class ListAllServicos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return styleScreenPattern(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          iconTheme: new IconThemeData(color: Colors.black),
          title: Text('SERVIÇOS',
            style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Principal'
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 3, left: 10, right: 10),
          child: Consumer<ServiceManager>(
            builder: (_, serviceManager, __){
              return ListView.builder(
                itemCount: serviceManager.servicos.length,
                itemBuilder: (_, index){
                  return ServiceListTile(serviceManager.servicos[index]);
                },
              );
            },
          ),
        )
      ),
    );
  }
}
