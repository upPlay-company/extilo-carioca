import 'package:extilo_carioca/model/profissionais/profissionais.dart';
import 'package:extilo_carioca/screen/profissionais/components/tela_profissionais_screen.dart';
import 'package:flutter/material.dart';

class ProfissionaisListTile extends StatelessWidget {

  ProfissionaisListTile(this.profissionais);

  final Profissionais profissionais;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => TelaProfissionaisScreen(profissionais)
        ));
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        child: Container(
          color: Colors.white,
          height: 60,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    profissionais.img.first
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                      profissionais.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Principal',
                          fontSize: 18,
                          fontWeight: FontWeight.w800
                      )
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
