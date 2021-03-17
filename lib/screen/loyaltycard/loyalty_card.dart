import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoyaltyCard extends StatefulWidget {
  @override
  _LoyaltyCardState createState() => _LoyaltyCardState();
}

class _LoyaltyCardState extends State<LoyaltyCard> {
  double sizeIconSocial = 50;
  @override
  Widget build(BuildContext context) {
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
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Principal'),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.10,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xff3c5a99),
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child: Center(
                    child: Text(
                      'Fidelidade',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.12),
                child: Container(
                  color: Colors.white,
                  child: GridView.count(
                    crossAxisCount: 5,
                    children: [
                      faithfulness(false),
                      faithfulness(false),
                      faithfulness(false),
                      faithfulness(false),
                      faithfulness(false),
                      faithfulness(false),
                      faithfulness(true),
                      faithfulness(true),
                      faithfulness(true),
                      faithfulness(true),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.width * 0.8,
                left: MediaQuery.of(context).size.width * 0.1,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Faltam",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 35,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "04",
                        style: TextStyle(
                          color: Color(0xff007e00),
                          fontWeight: FontWeight.w600,
                          fontSize: 35,
                        ),
                      ),
                    ),
                    Text(
                      "Créditos",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 35,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 80.0,
                        bottom: 50,
                      ),
                      child: Text(
                        "Troque seus créditos, vale 1 corte ou barba",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                launch(
                                    'https://www.facebook.com/ExtiloCarioca/');
                              },
                              child: Container(
                                height: sizeIconSocial,
                                width: sizeIconSocial,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'images/Icone face.png'))),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 50,
                          ),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  launch(
                                      'https://www.instagram.com/extilocarioca/');
                                },
                                child: Container(
                                  height: sizeIconSocial,
                                  width: sizeIconSocial,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'images/icone insta.png'))),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }

  //Declaração de funções
  Widget faithfulness(bool disabled) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(disabled
                  ? 'images/loyalty/disabled.png'
                  : 'images/loyalty/enabled.png'),
            ),
          ),
        ),
      ),
    );
  }
}
