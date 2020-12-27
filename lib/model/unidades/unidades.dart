import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class Unidades extends ChangeNotifier {

  Unidades({this.img}){
    img = img ?? [];
  }

  Unidades.fromDocument(DocumentSnapshot document){
    id = document.id;
    name = document.data()['name'] as String;
    address = document.data()['address'] as String;
    lat = document.data()['lat'] as double;
    long = document.data()['long'] as double;
    phone = document.data()['phone'] as String;
    img = List<String>.from(document.data()['img'] as List<dynamic>);
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  DocumentReference get firestoreRef => firestore.doc('unidades/$id');
  get storageRef => storage.ref().child('unidades/$id');

  String id;
  String name;
  String address;
  double lat;
  double long;
  String phone;
  List<String> img;

}