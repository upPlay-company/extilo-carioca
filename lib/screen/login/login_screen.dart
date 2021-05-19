import 'package:extilo_carioca/helpers/validators.dart';
import 'package:extilo_carioca/model/user/user.dart';
import 'package:extilo_carioca/model/user/user_manager.dart';
import 'package:extilo_carioca/screen/signup/signup_screen.dart';
import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  //Declarações de funções
  Widget _snackBarRecover(String msgRecovery, dynamic scaffoldKey) {
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
        key: scaffoldKey,
        body: Center(
          child: SingleChildScrollView(
            child: Consumer<UserManager>(
            builder: (_, userManager, __) {
              return Column(
                children: [
                  Container(
                    color: Colors.transparent,
                    child: Center(
                        child: Column(
                          children: [
                            Container(
                              height: 270,
                              width: 270,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('images/logo_pronto.png'),
                                  )),
                            ),
                            Container(
                                height: 50,
                                child: Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontFamily: 'Principal'),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  color: Theme.of(context).primaryColor,
                                )),
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
                                        enabled: !userManager.loading,
                                        autocorrect: false,
                                        validator: (email) {
                                          if (!emailValid(email)) {
                                            return 'Email inválido';
                                          }
                                          return null;
                                        },
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                        decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black)),
                                            labelText: 'Email',
                                            labelStyle: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontFamily: 'Principal')),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                      child: TextFormField(
                                        controller: passController,
                                        autocorrect: false,
                                        obscureText: true,
                                        enabled: !userManager.loading,
                                        validator: (pass) {
                                          if (pass.isEmpty || pass.length < 6) {
                                            return 'Senha inválida';
                                          }

                                          return null;
                                        },
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                        decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black)),
                                            labelText: 'Senha',
                                            labelStyle: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontFamily: 'Principal')),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (emailController.text.isEmpty)
                                          _snackBarRecover(
                                              "Insira seu e-mail para recuperação!",
                                              scaffoldKey);
                                        else {
                                          print(emailController.text);
                                          userManager.recoverPass(
                                              emailController.text);
                                          _snackBarRecover(
                                              "Verifique seu e-mail", scaffoldKey);
                                        }
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                                        child: Text(
                                          'Esqueceu sua senha?',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Principal'),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 54,
                                          width: 200,
                                          // ignore: deprecated_member_use
                                          child: RaisedButton(
                                            onPressed: userManager.loading ? null : (){
                                              if(formKey.currentState.validate()){
                                                userManager.signIn(
                                                  user: UserUser(
                                                      email: emailController.text,
                                                      password: passController.text
                                                  ),
                                                  onFail: (e){
                                                    // ignore: deprecated_member_use
                                                    scaffoldKey.currentState.showSnackBar(
                                                        SnackBar(
                                                          content: Text('Falha no login: $e',
                                                            style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                                                          ),
                                                          backgroundColor: Colors.blue,
                                                          behavior: SnackBarBehavior.floating,
                                                          margin: EdgeInsets.all(16),
                                                          duration: Duration(seconds: 2),
                                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                                                        )
                                                    );
                                                  },
                                                  onSuccess: (){
                                                    Navigator.of(context).pushNamed('/base');
                                                  },
                                                );
                                              }
                                            },
                                            color: Theme.of(context).primaryColor,
                                            child: userManager.loading
                                                ? const CircularProgressIndicator(
                                              valueColor:
                                              AlwaysStoppedAnimation(
                                                  Colors.white),
                                            )
                                                : Text(
                                              'Concluir',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20,
                                                  fontFamily: 'Principal'),
                                            ),
                                            disabledColor: Theme.of(context)
                                                .primaryColor
                                                .withAlpha(100),
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(30)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignUpScreen()));
                                      },
                                      child: Padding(
                                        padding:
                                        EdgeInsets.fromLTRB(20, 20, 20, 20),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Não tem conta? ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Principal'),
                                            ),
                                            Text(
                                              'Clique aqui',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Principal'),
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
                        )),
                  )
                ],
              );
            },
          )),
        ),
      ),
    );
  }
}
