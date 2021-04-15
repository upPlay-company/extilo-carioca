import 'package:extilo_carioca/model/agendamento/agendamento_manager.dart';
import 'package:extilo_carioca/model/home/banners_manager.dart';
import 'package:extilo_carioca/model/order_produtos/order_produtos.dart';
import 'package:extilo_carioca/model/produtos/product_manager.dart';
import 'package:extilo_carioca/model/profissionais/profissionais_manager.dart';
import 'package:extilo_carioca/model/servicos/service_manager.dart';
import 'package:extilo_carioca/model/user/user_manager.dart';
import 'package:extilo_carioca/screen/base/base_screen.dart';
import 'package:extilo_carioca/screen/cart/cart_screen.dart';
import 'package:extilo_carioca/screen/checkout/ckechout.dart';
import 'package:extilo_carioca/screen/confirmation/confirmation_screen.dart';
import 'package:extilo_carioca/screen/inicial/inicial_screen.dart';
import 'package:extilo_carioca/screen/login/login_screen.dart';
import 'package:extilo_carioca/screen/loyaltycard/loyalty_card.dart';
import 'package:extilo_carioca/screen/meus_agendamentos/meus_agendamentos_screen.dart';
import 'package:extilo_carioca/screen/profissionais/profissionais_screen.dart';
import 'package:extilo_carioca/screen/servicos/lista_produtos/lista_all_produtos_screen.dart';
import 'package:extilo_carioca/store/agendamento_store.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'model/carrinho/cart_manager.dart';
import 'model/order_produtos/order_manager.dart';
import 'model/unidades/unidades_manager.dart';
import 'screen/agendamento/agendamento.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocation();
  runApp(MyApp());
}

void setupLocation() {
  GetIt.I.registerSingleton(AgendamentoStore());
  GetIt.I.registerSingleton(UserManager());
  GetIt.I.registerSingleton(AgendamentosManager());
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
        ChangeNotifierProxyProvider<UserManager, AgendamentosManager>(
          create: (_) => AgendamentosManager(),
          lazy: false,
          update: (_, userManager, agendamentosManager) =>
          agendamentosManager..updateUser(userManager.user),
        ),
        ChangeNotifierProxyProvider<UserManager, CartManager>(
          create: (_) => CartManager(),
          lazy: false,
          update: (_, userManager, cartManager) =>
          cartManager..updateUser(userManager),
        ),
        ChangeNotifierProxyProvider<UserManager, OrdersManager>(
          create: (_) => OrdersManager(),
          lazy: false,
          update: (_, userManager, ordersManager) =>
          ordersManager..updateUser(userManager.user),
        ),
        ChangeNotifierProvider(
          create: (_) => ServiceManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ProductManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ProfissionaisManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => UnidadesManager(),
          lazy: false,
        )
      ],
      child: MaterialApp(
        title: 'Extilo Carioca',
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        theme: ThemeData(
          primaryColor: Color(0xff3c5a99),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: 'inicial',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/profissionais':
              return MaterialPageRoute(
                  builder: (_) => ProfissionaisScreen()
              );
            case '/meus_agendamentos':
              return MaterialPageRoute(
                  builder: (_) => MeusAgendamentosScreen()
              );
            case '/Cart':
              return MaterialPageRoute(
                  builder: (_) => CartScreen(),
                  settings: settings
              );
            case '/confirmation':
              return MaterialPageRoute(
                  builder: (_) => ConfirmationScreen(
                  settings.arguments as OrderProducts
              ));
            case '/checkout':
              return MaterialPageRoute(
                  builder: (_) => CheckoutScreen()
              );
            case '/produtos':
              return MaterialPageRoute(
                  builder: (_) => ListAllProduct()
              );
            case '/credito':
              return MaterialPageRoute(
                  builder: (_) => LoyaltyCard()
              );
            case '/agendamento':
              return MaterialPageRoute(
                  builder: (_) => SchedulingScreen()
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
