import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class SectionBanners extends ChangeNotifier {

  SectionBanners({this.img}){
    img = img ?? [];
  }

  SectionBanners.fromDocument(DocumentSnapshot document){
    id = document.id;
    name = document.data()['name'] as String;
    img = List<String>.from(document.data()['images'] as List<dynamic>);
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  DocumentReference get firestoreRef => firestore.doc('home/$id');
  get storageRef => storage.ref().child('home/$id');

  String id;
  String name;
  List<String> img;

}