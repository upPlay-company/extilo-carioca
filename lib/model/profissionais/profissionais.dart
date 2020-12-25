import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class Profissionais extends ChangeNotifier {

  Profissionais({this.img}){
    img = img ?? [];
  }

  Profissionais.fromDocument(DocumentSnapshot document){
    id = document.id;
    name = document.data()['name'] as String;
    img = List<String>.from(document.data()['img'] as List<dynamic>);
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  DocumentReference get firestoreRef => firestore.doc('profissionais/$id');
  get storageRef => storage.ref().child('profissionais/$id');

  String id;
  String name;
  List<String> img;

}