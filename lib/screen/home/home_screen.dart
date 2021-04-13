import 'package:extilo_carioca/common/drawer/custom_drawer.dart';
import 'package:extilo_carioca/model/home/banners_manager.dart';
import 'package:extilo_carioca/screen/agendamento/modais/servico_modal.dart';
import 'package:extilo_carioca/screen/home/components/banners_tile.dart';
import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return styleScreenPattern(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
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
        body: CustomScrollView(
          slivers: [
            Consumer<BannersManager>(
              builder: (_, bannersManager, __) {
                if (bannersManager.loading) {
                  return SliverToBoxAdapter(
                    child: LinearProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.black),
                      backgroundColor: Colors.transparent,
                    ),
                  );
                }
                final List<Widget> children =
                    bannersManager.banners.map<Widget>((banners) {
                  return BannersTile(banners);
                }).toList();
                return SliverList(
                  delegate: SliverChildListDelegate(children),
                );
              },
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ServiceModal()));
                              },
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'images/Agendar 3.png'))),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'AGENDAR',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed('/profissionais');
                              },
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'images/Profissionais.png'))),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'PROSSIONAIS',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/produtos');
                            },
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage('images/Pacotes.png'))),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'PRODUTOS',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/credito');
                            },
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image:
                                          AssetImage('images/Creditos.png'))),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'CRÉDITOS',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            launch('https://www.facebook.com/ExtiloCarioca/');
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image:
                                        AssetImage('images/Icone face.png'))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            launch('https://www.instagram.com/extilocarioca/');
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image:
                                        AssetImage('images/icone insta.png'))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
        endDrawer: CustomDrawer(),
      ),
    );
  }
}
