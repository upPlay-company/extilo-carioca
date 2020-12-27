import 'package:extilo_carioca/model/unidades/unidades.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UnidadesListTile extends StatelessWidget {

  UnidadesListTile(this.unidades);

  final Unidades unidades;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 150.0,
            child: Image.network(
              unidades.img.first,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  unidades.name,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      fontFamily: 'Principal'
                  ),
                ),
                Text(
                  unidades.address,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Principal'
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text("WhatsApp"),
                textColor: Colors.blue,
                padding: EdgeInsets.zero,
                onPressed: (){
                 // TODO: API WHATS
                },
              ),
              FlatButton(
                child: Text("Ver no Mapa"),
                textColor: Colors.blue,
                padding: EdgeInsets.zero,
                onPressed: (){
                  // TODO: API MAPS
                },
              ),
              FlatButton(
                child: Text("Ligar"),
                textColor: Colors.blue,
                padding: EdgeInsets.zero,
                onPressed: (){
                  // TODO: API PHONE
                },
              )
            ],
          )
        ],
      ),
    );
  }

  abrirGoogleMaps() async {
    const urlMap =
        "https://www.google.com/maps/search/?api=1&query=-22.9732303,-43.2032649";
    if (await canLaunch(urlMap)) {
      await launch(urlMap);
    } else {
      throw 'Could not launch Maps';
    }
  }

  abrirWhatsApp() async {
    var whatsappUrl = "whatsapp://send?phone=+55993686938&text=Olá,tudo bem ?";

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }
}
