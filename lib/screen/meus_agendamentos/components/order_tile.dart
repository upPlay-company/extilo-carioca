import 'package:extilo_carioca/model/agendamento/agendamentos.dart';
import 'package:flutter/material.dart';


class OrderTile extends StatelessWidget {

  const OrderTile(this.schedule);

  final Schedule schedule;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(
        children: [
          Text(schedule.serviceName)
        ],
      ),
    );
  }
}
