import 'package:extilo_carioca/screen/inicial/inicial_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Extilo Carioca',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff3c5a99),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'inicial',
      onGenerateRoute: (settings){
        switch(settings.name){
          case '/inicial':
            default:
              return MaterialPageRoute(
                builder: (_) => InicialScreen()
              );
        }
      },
      home: Container(),
    );
  }
}