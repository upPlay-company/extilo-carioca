import 'package:extilo_carioca/model/user/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.fromLTRB(32, 24, 16, 8),
        height: 100,
        child: Consumer<UserManager>(
          builder: (_, userManager, __){
            return Row(
              children: [
                Icon(Icons.person, color: Colors.white, size: 50,),
                SizedBox(width: 15,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 5,),
                      Text(
                        'Olá, ${userManager.user?.name ?? 'Convidado'}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(width: 20,)
                    ],
                  ),
                ),
              ],
            );
          },
        )
    );
  }
}
