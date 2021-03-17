import 'package:extilo_carioca/screen/agendamento/components/barber_field.dart';
import 'package:extilo_carioca/screen/agendamento/components/servicosfield.dart';
import 'package:extilo_carioca/store/createstore.dart';
import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

//Variaveis Globais
final Color primaryColor = Color(0xff078c9f);

class SchedulingScreen extends StatefulWidget {
  @override
  _SchedulingScreenState createState() => _SchedulingScreenState();
}

class _SchedulingScreenState extends State<SchedulingScreen> {
  double whiteMargin = 2.5;
  double imageMargin = 4.0;
  double schedulingPadding = 20;
  int barber;
  RoundedRectangleBorder styleShape = new RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30),
  );

  final CreateStore createStore = CreateStore();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return styleScreenPattern(
          child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                centerTitle: true,
                iconTheme: new IconThemeData(color: Colors.black),
                title: Text(
                  'EXTILO CARIOCA',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Principal'),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              body: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.4,
                      left: 12,
                      right: 12,
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                              top: schedulingPadding,
                              left: schedulingPadding,
                              right: schedulingPadding,
                            ),
                            child: Center(
                              child: Expanded(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 35,
                                      child: Text(
                                        "Agende seu horario",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    BarberField(createStore),
                                    ServicosField(createStore),
                                    ServicosField(createStore),
                                    scheduling(
                                      "Data e Hora",
                                      Icons.date_range,
                                      showModal: _showModalDate,
                                    ),
                                    styleButton(),
                                  ],
                                ),
                              ),
                            ),
                          ), //Padding do agendamento
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }

  //Declarações de funções

  Widget styleButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          width: 150,
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
                color: Color(0xff3c5a99),
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ),
    );
  }

  void _showModalDate() {
    showModalBottomSheet<void>(
      shape: styleShape,
      backgroundColor: Colors.black,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return modelContainer();
      },
    );
  }

  Container modelContainer({Widget child}) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: child,
    );
  }

  //Função Scheduling recebe parametros opcional, você passa uma rota ou passa uma função
  Widget scheduling(String title, IconData icon,
      {Widget rota, Function showModal}) {
    return GestureDetector(
      onTap: showModal ??
          () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => rota),
            );
          },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
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
                  child: Text(title,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Principal',
                          fontSize: 18,
                          fontWeight: FontWeight.w800)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
