import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extilo_carioca/screen/servicos/categorias/category_service.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  //variaveis
  final DocumentSnapshot snapshot;

  CategoryTile({this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(snapshot.data()["name"], style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold),
          ),
          trailing: Icon(Icons.keyboard_arrow_right, color: Theme.of(context).primaryColor,),
          onTap: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder:
                    (context)=>CategoryService(snapshot: snapshot))
            );
          },
        ),
        Container(
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey[300]))
          ),
        )
      ],
    );
  }
}
