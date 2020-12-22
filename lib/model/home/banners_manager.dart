import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extilo_carioca/model/home/section_banners.dart';
import 'package:flutter/cupertino.dart';

class BannersManager extends ChangeNotifier {

  BannersManager(){
    _loadSections();
  }

  List<SectionBanners> _banners = [];


  bool editing = false;
  bool loading = false;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> _loadSections() async {
    final QuerySnapshot snapBanners = 
        await firestore.collection('banners').get();

    _banners = snapBanners.docs.map(
        (b) => SectionBanners.fromDocument(b)).toList();
    notifyListeners();
  }

  List<SectionBanners> get banners {
    return _banners;
  }

}