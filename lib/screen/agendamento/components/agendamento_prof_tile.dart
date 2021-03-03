import 'package:extilo_carioca/model/profissionais/profissionais.dart';
import 'package:extilo_carioca/model/profissionais/profissionais_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgendamentoProfTile extends StatelessWidget {

  AgendamentoProfTile({this.showAll = true, this.selected});

  final Profissionais selected;
  final bool showAll;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfissionaisManager>(
      builder: (_, profissionaisManager, __){
        return ListView.separated(
          itemCount: profissionaisManager.profissionais.length,
          separatorBuilder: (_, __){
            return Divider(height: 0.1, color: Colors.grey,);         },
          itemBuilder: (_, index) {
            final profissionais = profissionaisManager.profissionais[index];

            return InkWell(
              onTap: () {
                print(profissionais.name);
                Navigator.of(context).pop(profissionais.name);
              },
              child: Container(
                height: 50,
                color: profissionais.id == selected?.id ?
                Theme.of(context).primaryColor.withAlpha(100) : null,
                alignment: Alignment.center,
                child: Text(
                  profissionais.name,
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: profissionais.id == selected?.id ?
                      FontWeight.bold : null
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
