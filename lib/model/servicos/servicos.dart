import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class Servicos extends ChangeNotifier {

  Servicos({this.img}){
    img = img ?? [];
  }

  Servicos.fromDocument(DocumentSnapshot document){
    id = document.id;
    name = document.data()['name'] as String;
    price = document.data()['price'] as Float;
    duracao = document.data()['duracao'] as int;
    img = List<String>.from(document.data()['img'] as List<dynamic>);
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  DocumentReference get firestoreRef => firestore.doc('servicos/$id');
  get storageRef => storage.ref().child('servicos/$id');

  String id;
  String name;
  Float price;
  int duracao;
  List<String> img;

}