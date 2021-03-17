import 'package:extilo_carioca/screen/agendamento/scheduling_modal.dart';
import 'package:extilo_carioca/store/createstore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class BarberField extends StatelessWidget {
  BarberField(this.createStore);

  final CreateStore createStore;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return GestureDetector(
        onTap: () async {
          final profissional = await showDialog(
            context: context,
            builder: (_) => SchedulingModal(
              selected: createStore.profissionais,
            ),
          );
          if (profissional != null) {
            createStore.setProfissional(profissional);
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
                  padding: const EdgeInsets.only(left: 20),
                  child: Icon(Icons.account_circle_rounded),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                        createStore.profissionais == null
                            ? 'Barbeiro'
                            : 'Barbeiro: ${createStore?.profissionais?.name}',
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
