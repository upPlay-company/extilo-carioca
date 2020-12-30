import 'package:extilo_carioca/common/drawer/custom_drawer.dart';
import 'package:extilo_carioca/model/user/user_manager.dart';
import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MinhaContaScreen extends StatelessWidget {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return styleScreenPattern(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          iconTheme: new IconThemeData(color: Colors.black),
          title: Text('MINHA CONTA',
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
        body: Consumer<UserManager>(
          builder: (_, userManager, __){
            return Form(
              key: formKey,
              child: ListView(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 150,
                          child: Padding(
                            padding: EdgeInsets.only(left: 110, right: 110, bottom: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage('images/logo_pronto.png'),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            initialValue: userManager.user.name,
                            decoration: InputDecoration(
                              labelText: 'Nome*',
                              labelStyle: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context).primaryColor
                              ),
                            ),
                          ),
                          TextFormField(
                            initialValue: userManager.user.email,
                            decoration: InputDecoration(
                              labelText: 'Email*',
                              labelStyle: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context).primaryColor
                              ),
                            ),
                          ),
                          TextFormField(
                            initialValue: userManager.user.phone,
                            decoration: InputDecoration(
                              labelText: 'Telefone',
                              labelStyle: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context).primaryColor
                              ),
                            ),
                          ),
                          TextFormField(
                            initialValue: userManager.user.datanasc,
                            decoration: InputDecoration(
                              labelText: 'Data de Nascimento',
                              labelStyle: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context).primaryColor
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text('(*) Campos obrigatórios',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Principal',
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 54,
                                width: 200,
                                child: RaisedButton(
                                  onPressed: (){
                                    // TODO: ATUALIZAR DADOS USUARIOS
                                  },
                                  color: Theme.of(context).primaryColor,
                                  child: userManager.loading ?
                                  const CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation(Colors.white),
                                  ) : Text(
                                    'ATUALIZAR',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        fontFamily: 'Principal'
                                    ),
                                  ),
                                  disabledColor: Theme.of(context).primaryColor.withAlpha(100),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: (){
                              // TODO: ALTERAR SENHA
                            },
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Alterar Senha',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Principal'
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
        endDrawer: CustomDrawer(),
      ),
    );
  }
}
