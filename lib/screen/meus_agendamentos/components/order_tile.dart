import 'package:extilo_carioca/model/agendamento/agendamento_manager.dart';
import 'package:extilo_carioca/model/agendamento/agendamentos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class OrderTile extends StatelessWidget {

  const OrderTile(this.schedule);

  final Schedule schedule;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Serviço: ${schedule.serviceName}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            SizedBox(height: 5),
            Text("Data: ${schedule.DateBanco.toDate().day}/${schedule.DateBanco.toDate().month}/${schedule.DateBanco.toDate().year}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            SizedBox(height: 5),
            Text("Hora: ${schedule.hour} horas", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            SizedBox(height: 5),
            Text("Preço: R\$${schedule.servicePrice.toStringAsFixed(2)}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            SizedBox(height: 5),
            Text("Duração: ${schedule.serviceDuration}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            SizedBox(height: 5),
            Text("Profissional: ${schedule.nameEmployee}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            SizedBox(height: 5),
            if(schedule.concluded == false)
              Container(
                padding: EdgeInsets.all(8),
                color: Theme.of(context).primaryColor,
                child: Center(child: Text("Serviço ainda não realizado", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500))))
            else
              Container(
                  padding: EdgeInsets.all(8),
                  color: Theme.of(context).primaryColor,
                  child: Center(child: Text("Serviço realizado", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)))),
            if(schedule.concluded == false)
              Consumer<AgendamentosManager>(
                  builder: (_, agendamentoManager, __){
                    return Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20, top: 10),
                      child: ElevatedButton(
                          onPressed: (){
                            agendamentoManager.remove(schedule);
                          },
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          child: Text('Cancelar Agendamento', style: TextStyle(fontSize: 16),)
                      ),
                    );
                  })
          ],
        ),
      ),
    );
  }
}
