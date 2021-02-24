import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/material.dart';

//Variaveis Globais
final Color primaryColor = Color(0xff078c9f);
String url = "https://media-exp1.licdn.com/dms/image/C560BAQHMnA03XDdf3w/company-logo_200_200/0/1519855918965?e=2159024400&v=beta&t=CrP5Le1mWICRcaxIGNBuajHcHGFPuyNA5C8DI339lSk";

class SchedulingScreen extends StatefulWidget {
  @override
  _SchedulingScreenState createState() => _SchedulingScreenState();
}

class _SchedulingScreenState extends State<SchedulingScreen> {

  double whiteMargin = 2.5;
  double imageMargin = 4.0;

  @override
  Widget build(BuildContext context) {
    return styleScreenPattern(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            iconTheme: new IconThemeData(color: Colors.black),
            title: Text('EXTILO CARIOCA',
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
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 310,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20.0,
                            left: 20,
                            right: 20,
                          ),
                          child: Center(
                            child: Expanded(
                              child: Column(
                                children: [
                                  scheduling(
                                    "Serviço", Icons.cut,
                                    showModal: _showModalData
                                  ),
                                  scheduling(
                                    "Barbeiro", Icons.account_circle,
                                    showModal: _showModalProfissional,
                                  ),
                                  scheduling(
                                    "Data e Hora", Icons.date_range,
                                    showModal: _showModalProfissional,
                                  ),
                                  styleButton(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }

  //Declarações de funções

  Widget styleButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        width: 120,
        height: 50,
        child: Container(
          child: Center(
            child: Text(
              "AGENDAR",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20)
          ),
        ),
      ),
    );
  }

  void _showModalData() {
    showModalBottomSheet<void>(
      backgroundColor: Colors.black,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
        );
      },
    );
  }

  void _showModalProfissional() {
    showModalBottomSheet<void>(
      backgroundColor: Colors.black,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
          ),
        );
      },
    );
  }

  //Função Scheduling recebe parametros opcional, você passa uma rota ou passa uma função
  Widget scheduling(String title, IconData icon, {Widget rota, Function showModal}) {
    return GestureDetector(
      onTap: showModal ??
              () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => rota),
            );
          },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        child: Container(
          color: Colors.white,
          height: 60,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Icon(icon),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Principal',
                          fontSize: 18,
                          fontWeight: FontWeight.w800
                      )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



}

