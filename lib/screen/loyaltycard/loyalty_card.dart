import 'package:extilo_carioca/model/user/user_manager.dart';
import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

class LoyaltyCard extends StatefulWidget {
  @override
  _LoyaltyCardState createState() => _LoyaltyCardState();
}

class _LoyaltyCardState extends State<LoyaltyCard> {

  @override
  Widget build(BuildContext context) {

    final userManager = context.watch<UserManager>();

    return styleScreenPattern(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            iconTheme: new IconThemeData(color: Colors.black),
            title: Text(
              'FIDELIDADE',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Principal'),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Column(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 50,),
                  Text(
                    "Seus créditos",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 26,
                    ),
                  ),
                  if(userManager.user.credito != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        '${userManager.user.credito}',
                        style: TextStyle(
                          color: Color(0xff007e00),
                          fontWeight: FontWeight.w600,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  if(userManager.user.credito == null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        '0',
                        style: TextStyle(
                          color: Color(0xff007e00),
                          fontWeight: FontWeight.w600,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 40.0,
                      bottom: 50,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Troque seus créditos, por serviço na",
                          style: TextStyle(
                            color: Colors.grey[1000],
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Barbeario Extilo Carioca',
                          style: TextStyle(
                            color: Colors.grey[1000],
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              launch(
                                  'https://www.facebook.com/ExtiloCarioca/');
                            },
                            child: Container(
                              height: 40,
                              width: 40,
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
                                height: 40,
                                width: 40,
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
              )
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
