import 'package:carousel_pro/carousel_pro.dart';
import 'package:extilo_carioca/model/profissionais/profissionais.dart';
import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TelaProfissionaisScreen extends StatelessWidget {

  TelaProfissionaisScreen(this.profissionais);

  final Profissionais profissionais;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: profissionais,
      child: styleScreenPattern(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              centerTitle: true,
              iconTheme: new IconThemeData(color: Colors.black),
              title: Text(
                'PROFISSIONAIS',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Principal'
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Scaffold(
              backgroundColor: Colors.white,
              body: ListView(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1,
                    child: Carousel(
                      images: profissionais.img.map((url){
                        return NetworkImage(url);
                      }).toList(),
                      dotSize: 4,
                      dotBgColor: Colors.transparent,
                      dotColor: Colors.black,
                      autoplay: false,
                      dotSpacing: 15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      height: 55,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(13),
                            child: Row(
                              children: [
                                Icon(Icons.account_circle,
                                     size: 23,
                                     color: Colors.white,),
                                SizedBox(width: 10,),
                                Text(
                                  profissionais.name,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}