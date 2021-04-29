import 'package:extilo_carioca/common/price_card.dart';
import 'package:extilo_carioca/model/carrinho/cart_manager.dart';
import 'package:extilo_carioca/model/checkout/checkout_manager.dart';
import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider<CartManager, CheckoutManager>(
      create: (_) => CheckoutManager(),
      update: (_, cartManager, checkoutManager) =>
      checkoutManager..updateCart(cartManager),
      lazy: false,
      child: styleScreenPattern(
        child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const Text('Confirmação', style: TextStyle(color: Colors.black),),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
            ),
            body: Consumer<CheckoutManager>(
              builder: (_, checkoutManager, __){
                if(checkoutManager.loading){
                  return Center(
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            ),
                            const SizedBox(height: 16,),
                            Text(
                              'Confirmando seu pedido...',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return ListView(
                  children: [
                    PriceCard(
                      buttonText: 'Finalizar Pedido',
                      onPressed: (){
                        checkoutManager.checkout(
                            onStockFail: (e){
                              Navigator.of(context).popUntil(
                                      (route) => route.settings.name == '/Cart');
                            },
                            onSuccess: (order) {
                              Navigator.of(context).pushNamed(
                                  '/confirmation',
                                  arguments: order
                              );
                            });
                      },
                    )
                  ],
                );
              },
            )
        ),
      ),
    );
  }
}
