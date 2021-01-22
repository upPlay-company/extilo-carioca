import 'package:extilo_carioca/model/user/user_manager.dart';
import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class AlterarSenhaScreen extends StatelessWidget {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  //Declarações de funções
  Widget _snackBarNewPss(String msgRecovery, dynamic scaffoldKey) {
    return scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        msgRecovery,
        style: TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.blue,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(16),
      duration: Duration(seconds: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
    ));
  }


  //Fim Declarações de funções

  @override
  Widget build(BuildContext context) {
    return styleScreenPattern(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          iconTheme: new IconThemeData(color: Colors.black),
          title: Text('ALTERAR SENHA',
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
                            controller: passController,
                            autocorrect: false,
                            obscureText: true,
                            validator: (pass) {
                              if(pass.isEmpty)
                                return 'Campo obrigatório';
                              else if(pass.length < 6)
                                return 'Senha muito curta';
                              return null;
                            },
                            onSaved: (pass) => userManager.user.password = pass,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black)
                                ),
                                labelText: 'Nova Senha',
                                labelStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontFamily: 'Principal'
                                )
                            ),
                          ),
                          TextFormField(
                            autocorrect: false,
                            obscureText: true,
                            enabled: !userManager.loading,
                            validator: (pass) {
                              if(pass.isEmpty)
                                return 'Campo obrigatório';
                              else if(pass.length < 6)
                                return 'Senha muito curta';
                              return null;
                            },
                            onSaved: (pass) => userManager.user.confirmPassword = pass,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black)
                                ),
                                labelText: 'Confirma Senha',
                                labelStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontFamily: 'Principal'
                                )
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
                                  onPressed: () {
                                    userManager.newPass(passController.text);

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
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
