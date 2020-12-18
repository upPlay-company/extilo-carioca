import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return styleScreenPattern(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text('EXTILO CARIOCA',
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
        body: ListView(
          children: [
            // TODO: CORROSEL BANNERS
            // TODO: LISTA DE ICONES OPÇÕES
            // TODO: FACEBOOK E INSTAGRAM
            // TODO: ENDEREÇO
          ],
        ),
      ),
    );
  }
}
