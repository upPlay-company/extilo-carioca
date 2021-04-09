import 'package:extilo_carioca/screen/agendamento/modais/servico_modal.dart';
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
        onTap: () async {
          final servicos = await showDialog(
            context: context,
            builder: (_) => ServiceModal(
              selected: createStore.servicos,
            ),
          );
          if (servicos != null) {
            createStore.setServicos(servicos);
          }
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
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Icon(Icons.cut),
                ),
                Text(
                  createStore.servicos == null
                      ? 'Serviços'
                      : 'Serviço: ${createStore?.servicos?.name}',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Principal',
                      fontSize: 18,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
