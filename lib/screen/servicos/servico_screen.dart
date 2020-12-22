import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/material.dart';

class ServicoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return styleScreenPattern(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          iconTheme: new IconThemeData(color: Colors.black),
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
      ),
    );
  }
}
