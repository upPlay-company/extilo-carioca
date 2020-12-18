import 'package:extilo_carioca/screen/home/home_screen.dart';
import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return styleScreenPattern(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        key: scaffoldKey,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.transparent,
                  child: Center(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Container(
                                height: 50,
                                child: Center(
                                  child: Row(
                                    children: [
                                      Container(
                                          width: 60,
                                          child: Icon(
                                            Icons.arrow_back,
                                            color: Colors.white,
                                          )
                                      ),
                                      Text(
                                        'Cadastro',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontFamily: 'Principal'
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  color: Theme.of(context).primaryColor,
                                )
                            ),
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
                                      keyboardType: TextInputType.name,
                                      autocorrect: false,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                      decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.black)
                                          ),
                                          labelText: 'Nome Completo',
                                          labelStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontFamily: 'Principal'
                                          )
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    child: TextFormField(
                                      keyboardType: TextInputType.datetime,
                                      autocorrect: false,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                      decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.black)
                                          ),
                                          labelText: 'Data de nascimento',
                                          labelStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontFamily: 'Principal'
                                          )
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
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
                                              color: Colors.black,
                                              fontFamily: 'Principal'
                                          )
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                                              color: Colors.black,
                                              fontFamily: 'Principal'
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
                                          labelText: 'Confirma Senha',
                                          labelStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontFamily: 'Principal'
                                          )
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
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Principal'
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
                                          onPressed: (){
                                            Navigator.of(context).pushNamed('/base');
                                          },
                                          color: Theme.of(context).primaryColor,
                                          child: Text(
                                            'Concluir',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20,
                                                fontFamily: 'Principal'
                                            ),
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30)
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20)),
                                        color: Colors.white,
                                      )
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
