import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extilo_carioca/helpers/convert_date.dart';
import 'package:extilo_carioca/model/agendamento/agendamentos.dart';
import 'package:extilo_carioca/model/profissionais/profissionais.dart';
import 'package:extilo_carioca/model/servicos/servicos.dart';
import 'package:extilo_carioca/screen/agendamento/components/EasyLoading.dart';
import 'package:extilo_carioca/store/list_agendamentos_store.dart';
import 'package:extilo_carioca/style/ButtonStyles.dart';
import 'package:extilo_carioca/style/Colors.dart';
import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:table_calendar/table_calendar.dart';

// ignore: must_be_immutable
class CalendarBarber extends StatefulWidget {
  @override
  _CalendarBarberState createState() => _CalendarBarberState(servico);
  String userName;
  Profissionais barber;
  Servicos servico;

  CalendarBarber({Profissionais barber, Servicos servico}) {
    this.barber = barber;
    this.servico = servico;
  }
}

class _CalendarBarberState extends State<CalendarBarber> {
  CalendarController _calendarController = CalendarController();

  _CalendarBarberState(this.servico);

  final ListAgendamentoStore agendamentoStore = GetIt.I<ListAgendamentoStore>();

  String username;
  String thumbnailUser;
  Profissionais barber;
  Servicos servico;
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  Color todayColor = accentColor;
  int indexColor;
  int weekDay;
  DateTime daySelected;
  int hourSelected;
  int minutosSelected;

  DateTime holiday;
  var daysWeek;
  var hours;
  var avalible = [];

  bool isHoliday = false;

  @override
  void initState() {
    super.initState();
    username = 'teste';
    barber = widget.barber;
    _getUser();
    init();

    //DateTime now = DateTime.now();
  }

  _getUser() async {
    var user = await db.collection('users').doc(auth.currentUser.uid).get();
    username = user.data()['name'];
  }

  void init() async {
    DateTime now = dateUtc(DateTime.now(), '-');
    weekDay = now.weekday;
    setState(() {
      daySelected = now;
      holiday = now;
    });
    await _isHoliday(holi: now);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _calendarController.dispose();
    super.dispose();
  }

  _schedule() async {
    if (daysWeek[weekDay - 1] == true) {
      DateTime now = dateUtc(DateTime.now(), '-');
      if (daySelected.isBefore(now)) {
        EasyLoading.showError('Data anterior ao dia de Atual!');
      } else if (hourSelected != null) {
        easyLoading();
        var isEmpty = await _confirmIsEmpty();

        if (isEmpty) {
          Schedule schedule = Schedule(
              date: daySelected,
              hour: hourSelected,
              minutos: minutosSelected,
              employeeId: barber.id,
              nameCustomer: username,
              thumbnailCustomer: auth.currentUser.email,
              concluded: false,
              avaliacao: false,
              customerId: auth.currentUser.uid,
              nameEmployee: barber.name,
              serviceName: servico.name,
              serviceDuration: servico.duracao,
              servicePrice: servico.price);
          db.collection('schedules').add(schedule.toMap()).then((value) {
            EasyLoading.showSuccess('Agendamento salvo com sucesso!');
            Navigator.pushReplacementNamed(context, '/base');
          }).catchError((error) {
            EasyLoading.showSuccess(
                'hove algum problema por favor tente novamente !');
          });
        } else {
          EasyLoading.showError('Horario indisponivel!');
        }
      } else {
        EasyLoading.showError('Selecione um horário');
      }
    } else {
      EasyLoading.showError('Dia da semana nao disponivel!');
    }
  }

  _getConfigs() async {
    var res = await db.collection('configurations').doc('config').get();
    setState(() {
      daysWeek = res.data()['daysWeek'];
      hours = res.data()['hours'];
    });
  }

  _confirmIsEmpty() async {
    await _getConfigs();
    var res = await db
        .collection('schedules')
        .where('employeeId', isEqualTo: barber.id)
        .where('date', isEqualTo: daySelected)
        .where('hour', isEqualTo: hourSelected)
        .where('minutos', isEqualTo: minutosSelected)
        .get();
    List<DocumentSnapshot> documentsSnapshots = res.docs.toList();

    return documentsSnapshots.isEmpty;
  }

  // ignore: unused_element
  _getschedules({DateTime date}) async {
    await _getConfigs();
    var res = await db
        .collection('schedules')
        .where('employeeId', isEqualTo: barber.id)
        .where('date', isEqualTo: daySelected)
        .get();
    List<DocumentSnapshot> documentsSnapshots = res.docs.toList();
    documentsSnapshots.map((e) {
      hours[e['hour']] = false;
    });
    setState(() {
      avalible = hours;
    });
    Future.delayed(Duration(seconds: 1), () {
      EasyLoading.dismiss();
    });
  }

  _isHoliday({DateTime holi}) async {
    easyLoading();
    await db
        .collection('holidays')
        .where('date', isEqualTo: holi)
        .get()
        .then((value) async {
      if (value.docs.isNotEmpty == true) {
        setState(() {
          isHoliday = true;
        });
        EasyLoading.dismiss();
      } else {
        isHoliday = false;
        await _getschedules();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return styleScreenPattern(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'AGENDAR',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          centerTitle: true,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.transparent,
          child: SlidingSheet(
            minHeight: 50,
            color: Color(0xFFf5f5f5),
            elevation: 8,
            cornerRadius: 16,
            headerBuilder: (context, state) => _headerSlide(),
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.25, 0.7, 1.0],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            body: _calendar(),
            builder: (context, state) {
              if (isHoliday == true) {
                return Center(
                  child: Text('hoje nao abriremos'),
                );
              } else {
                return _bodySliding();
              }
            },
          ),
        ),
      ),
    );
  }

  _bodySliding() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 50,
            child: ListView.builder(
              itemCount: avalible.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (avalible == null) {
                  return Center(
                    child: Text('horarios indisponivies'),
                  );
                } else if (avalible[index]['bool'] == true) {
                  return _listTile(enable: true, index: index);
                } else {
                  return SizedBox();
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: btPrimary(
                call: () {
                  _schedule();
                },
                lable: 'Agendar',
                context: context),
          )
        ],
      ),
    );
  }

  _calendar() {
    return Container(
      color: Colors.white,
      child: TableCalendar(
        availableGestures: AvailableGestures.horizontalSwipe,
        headerStyle: HeaderStyle(
          titleTextStyle: TextStyle(color: Colors.black),
          formatButtonVisible: false,
          leftChevronIcon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 14,
          ),
          rightChevronIcon: Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
            size: 14,
          ),
          centerHeaderTitle: true,
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
            weekendStyle: TextStyle(color: Colors.black),
            weekdayStyle: TextStyle(color: Colors.black)),
        calendarStyle: CalendarStyle(
          selectedColor: Theme.of(context).primaryColor,
          todayColor: todayColor,
          weekdayStyle: TextStyle(color: Colors.black),
          weekendStyle: TextStyle(color: Colors.black),
        ),
        calendarController: _calendarController,
        onDaySelected: (day, events, holidays) async {
          //print(day);
          DateTime dayTime = dateUtc(day, '-');
          setState(() {
            hourSelected = null;
            holiday = dayTime;
            daySelected = dayTime;
            weekDay = dayTime.weekday;
            todayColor = Colors.transparent;
            indexColor = null;
          });
          await _isHoliday(holi: dayTime);
        },
      ),
    );
  }

  Widget _listTile({
    int index,
    bool enable,
  }) {
    return Card(
        color: indexColor == index ? Theme.of(context).primaryColor : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () async {
              setState(() {
                hourSelected = avalible[index]['hour'];
                minutosSelected = avalible[index]['minutos'];
                indexColor = index;
              });
            },
            child: Center(
              child: Text(
                '${avalible[index]['hour']}:${avalible[index]['minutos']}0',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ));
  }

  Widget _headerSlide() {
    return Material(
      elevation: 4,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 30,
                height: 2,
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
