import 'package:extilo_carioca/screen/agendamento/servico_modal.dart';
import 'package:extilo_carioca/store/createstore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ServicosField extends StatelessWidget {
  ServicosField(this.createStore);

  final CreateStore createStore;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (_) => ServiceModal(
              selected: createStore.servicos,
            ),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            height: 60,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Icon(Icons.cut),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("title",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Principal',
                            fontSize: 18,
                            fontWeight: FontWeight.w800)),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
