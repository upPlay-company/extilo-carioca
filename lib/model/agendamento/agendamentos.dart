
import 'package:cloud_firestore/cloud_firestore.dart';

class Schedule {
  String id;
  String nameCustomer;
  String employeeId;
  DateTime date;
  // ignore: non_constant_identifier_names
  Timestamp DateBanco;
  String thumbnailCustomer;
  String nameEmployee;
  String serviceName;
  String serviceDuration;
  int servicePrice;
  int hour;
  int minutos;
  bool concluded;
  String customerId;

  Schedule(
      {String nameCustomer,
      String employeeId,
      DateTime date,
      int hour,
      int minutos,
      bool concluded,
      String thumbnailCustomer,
      String nameEmployee,
      String id,
      String customerId,
      String serviceName,
      String serviceDuration,
      int servicePrice}) {
    this.nameCustomer = nameCustomer;
    this.employeeId = employeeId;
    this.date = date;
    this.hour = hour;
    this.minutos = minutos;
    this.concluded = concluded;
    this.thumbnailCustomer = thumbnailCustomer;
    this.nameEmployee = nameEmployee;
    this.id = id;
    this.customerId = customerId;
    this.serviceName = serviceName;
    this.serviceDuration = serviceDuration;
    this.servicePrice = servicePrice;
  }

  Schedule.fromDocument(DocumentSnapshot document){
    id = document.id;
    nameCustomer = document.data()['nameCustomer'];
    employeeId = document.data()['employeeId'];
    DateBanco = document.data()['date'];
    hour = document.data()['hour'];
    minutos = document.data()['minutos'];
    concluded = document.data()['concluded'];
    thumbnailCustomer = document.data()['thumbnailCustomer'];
    nameEmployee = document.data()['nameEmployee'];
    customerId = document.data()['customerId'];
    serviceName = document.data()['serviceName'];
    servicePrice = document.data()['servicePrice'];
    serviceDuration = document.data()['serviceDuration'];
  }

  toMap() {
    return {
      'nameCustomer': this.nameCustomer,
      'employeeId': this.employeeId,
      'date': this.date,
      'hour': this.hour,
      'minutos': this.minutos,
      'concluded': this.concluded,
      'thumbnailCustomer': this.thumbnailCustomer,
      'nameEmployee': this.nameEmployee,
      'customerId': this.customerId,
      'serviceName': this.serviceName,
      'servicePrice': this.servicePrice,
      'serviceDuration': this.serviceDuration
    };
  }

  @override
  String toString() {
    return 'Schedule{id: $id, nameCustomer: $nameCustomer, employeeId: $employeeId, date: $date, DateBanco: $DateBanco, thumbnailCustomer: $thumbnailCustomer, nameEmployee: $nameEmployee, serviceName: $serviceName, serviceDuration: $serviceDuration, servicePrice: $servicePrice, hour: $hour, minutos: $minutos, concluded: $concluded, customerId: $customerId}';
  }
}
