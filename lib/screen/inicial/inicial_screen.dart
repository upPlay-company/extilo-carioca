import 'package:extilo_carioca/model/user/user_manager.dart';
import 'package:extilo_carioca/screen/base/base_screen.dart';
import 'package:extilo_carioca/screen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

class InicialScreen extends StatefulWidget {
  @override
  _InicialScreenState createState() => _InicialScreenState();
}

class _InicialScreenState extends State<InicialScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserManager>(context);
    if(user.isLoggedIn){
      return _TelaHome();
    }
    else {
      return _Telalogin();
    }
  }
}

Widget _Telalogin() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 4,
        navigateAfterSeconds: LoginScreen(),
        loaderColor: Colors.transparent,
      ),
      Container(
          color: Colors.white,
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/Fundo.png'),
                      fit: BoxFit.cover)),
              child: Center(
                child: Container(
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('images/logo_pronto.png'),
                  )),
                ),
              )))
    ],
  );
}

Widget _TelaHome() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 4,
        navigateAfterSeconds: BaseScreen(),
        loaderColor: Colors.transparent,
      ),
      Container(
          color: Colors.white,
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/Fundo.png'),
                      fit: BoxFit.cover)),
              child: Center(
                child: Container(
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/logo_pronto.png'),
                      )),
                ),
              )))
    ],
  );
}
