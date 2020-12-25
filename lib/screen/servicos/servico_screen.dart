import 'package:extilo_carioca/screen/servicos/lista_servicos/lista_all_servicos_screen.dart';
import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/material.dart';

import 'lista_produtos/lista_all_produtos_screen.dart';

class ServicoScreen extends StatelessWidget {
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
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Principal'
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ListAllServicos()
                    )
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
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/lamina-de-barbear.png')
                              )
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                                'Serviços',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Principal',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800
                                )
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                Icon(Icons.arrow_forward_ios)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ListAllProduct()
                  )
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
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/espuma-de-barbear.png'),
                                )
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                                'Produtos',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Principal',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800
                                )
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                Icon(Icons.arrow_forward_ios)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
