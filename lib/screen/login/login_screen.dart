import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return styleScreenPattern(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        key: formKey,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    color: Colors.transparent,
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            height: 300,
                            width: 300,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('images/logo_pronto.png'),
                                )
                            ),
                          ),
                          Container(
                              height: 50,
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                color: Theme.of(context).primaryColor,
                              )
                          ),
                          Container(
                            color: Colors.white,
                            child: Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                    child: TextFormField(
                                      controller: emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      autocorrect: false,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black)
                                        ),
                                        labelText: 'Email',
                                        labelStyle: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black
                                        )
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    child: TextFormField(
                                      controller: passController,
                                      keyboardType: TextInputType.emailAddress,
                                      autocorrect: false,
                                      obscureText: true,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                      decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.black)
                                          ),
                                          labelText: 'Senha',
                                          labelStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black
                                          )
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      // TODO: IMPLEMENTAR ESQUECEU SENHA
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                                      child: Text(
                                        'Esqueceu sua senha?',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      // TODO: IMPLEMENTAR ENTRAR COM FACEBOOK
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 25,
                                            width: 25,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage('images/Icone face.png'),
                                                fit: BoxFit.contain
                                              )
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Text(
                                            'Entrar com o facebook',
                                            style: TextStyle(
                                              color: Theme.of(context).primaryColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 54,
                                        width: 200,
                                        child: RaisedButton(
                                          onPressed: (){},
                                          color: Theme.of(context).primaryColor,
                                          child: Text(
                                            'Concluir',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20
                                            ),
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30)
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      // TODO: IMPLEMENTAR ESQUECEU SENHA
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Não tem conta? ',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          Text(
                                            'Clique aqui',
                                            style: TextStyle(
                                                color: Theme.of(context).primaryColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
