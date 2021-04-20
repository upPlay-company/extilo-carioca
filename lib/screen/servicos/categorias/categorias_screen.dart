import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/material.dart';

import 'category_tile.dart';

class CategoriasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return styleScreenPattern(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Text(
            'Categorias',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection("categoria").orderBy('pos').get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(),
              );
            else {

              return ListView(
                children: snapshot.data.docs.map((doc) {
                  return CategoryTile(snapshot: doc,);
                }).toList(),
              );
            }
          },
        )
      ),
    );
  }
}
