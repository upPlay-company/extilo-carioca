import 'package:extilo_carioca/model/user/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'custom_drawer_header.dart';
import 'drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
      child: Drawer(
          child: Consumer<UserManager>(
            builder: (_, userManager, __){
              return Container(
                color: Colors.white,
                child: ListView(
                  children: <Widget>[
                    CustomDrawerHeader(),
                    DrawerTile(
                      iconData: Icons.event,
                      title: 'Agendar Serviço',
                      page: 0,
                    ),
                    DrawerTile(
                        iconData: Icons.filter,
                        title: 'Meus Agendamentos',
                        page: 1
                    ),
                    // DrawerTile(
                    //     iconData: Icons.query_builder,
                    //     title: 'Meus Pedidos',
                    //     page: 2
                    // ),
                    DrawerTile(
                        iconData: Icons.location_on,
                        title: 'Unidades',
                        page: 2
                    ),
                    DrawerTile(
                        iconData: Icons.person_outline,
                        title: 'Minha Conta',
                        page: 3
                    ),
                    SizedBox(height: 10,),
                    Divider(),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        if(userManager.isLoggedIn){
                          userManager.signOut();
                          Navigator.of(context).pushNamed('/login');
                        } else {
                          Navigator.of(context).pushNamed('/login');
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 35),
                        child: Row(
                          children: [
                            Icon(
                              Icons.exit_to_app,
                              size: 30,
                              color: Colors.black,
                            ),
                            SizedBox(width: 30,),
                            Text(
                              userManager.isLoggedIn
                                  ? 'Sair'
                                  : 'Sair',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Divider(),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('v. 1.0.1+4',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Pricipal',
                                fontSize: 16
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          )
      ),
    );
  }
}
