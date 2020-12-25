import 'package:extilo_carioca/model/home/banners_manager.dart';
import 'package:extilo_carioca/model/produtos/product_manager.dart';
import 'package:extilo_carioca/model/servicos/service_manager.dart';
import 'package:extilo_carioca/model/user/user_manager.dart';
import 'package:extilo_carioca/screen/base/base_screen.dart';
import 'package:extilo_carioca/screen/inicial/inicial_screen.dart';
import 'package:extilo_carioca/screen/login/login_screen.dart';
import 'package:extilo_carioca/screen/servicos/servico_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BannersManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ServiceManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ProductManager(),
          lazy: false,
        )
      ],
      child: MaterialApp(
        title: 'Extilo Carioca',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xff3c5a99),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: 'inicial',
        onGenerateRoute: (settings){
          switch(settings.name){
            case '/servicos':
              return MaterialPageRoute(
                  builder: (_) => ServicoScreen()
              );
            case '/login':
              return MaterialPageRoute(
                builder: (_) => LoginScreen()
              );
            case '/base':
              return MaterialPageRoute(
                builder: (_) => BaseScreen()
              );
            case '/inicial':
              default:
                return MaterialPageRoute(
                  builder: (_) => InicialScreen()
                );
          }
        },
      ),
    );
  }
}