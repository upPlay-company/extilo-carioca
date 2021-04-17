import 'package:extilo_carioca/model/unidades/unidades.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
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
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  primary: Colors.green,
                ),
                child: Icon(LineIcons.whatsapp),
                onPressed: (){
                  // TODO: VERIFICAR NO CELL REAL
                  dynamic main;
                  main = launch("whatsapp://send?phone=${unidades.whatsapp}&text=Olá,tudo bem ?");
                  print(main);
                },
              ),
              TextButton(
                child: Icon(Icons.location_pin),
                style: TextButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  padding: EdgeInsets.zero,
                ),
                onPressed: () async {
                  launch("https://www.google.com/maps/search/?api=1&query=${unidades.lat},"
                      "${unidades.long}");
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  padding: EdgeInsets.zero,
                ),
                child: Icon(LineIcons.phone),
                onPressed: (){
                  launch("tel:${unidades.phone}");
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
