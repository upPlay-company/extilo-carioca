import 'package:extilo_carioca/screen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InicialScreen extends StatefulWidget {
  @override
  _InicialScreenState createState() => _InicialScreenState();
}

class _InicialScreenState extends State<InicialScreen> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(Duration(seconds: 4)).then((_){
      // TODO: VERIFICAR USUARIO LOGADO
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/Fundo.png'),
              fit: BoxFit.cover
            )
        ),
        child: Center(
          child: Container(
            height: 350,
            width: 350,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/logo_pronto.png'),
                )
            ),
          ),
        ),
      ),
    );
  }
}
