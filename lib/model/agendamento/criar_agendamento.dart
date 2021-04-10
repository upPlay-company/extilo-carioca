class Schedule {
  String id;
  String nameCustomer;
  String employeeId;
  DateTime date;
  String thumbnailCustomer;
  String nameEmployee;
  String serviceName;
  String serviceDuration;
  int servicePrice;
  int hour;
  bool concluded;
  String customerId;

  Schedule(
      {String nameCustomer,
      String employeeId,
      DateTime date,
      int hour,
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
    this.concluded = concluded;
    this.thumbnailCustomer = thumbnailCustomer;
    this.nameEmployee = nameEmployee;
    this.id = id;
    this.customerId = customerId;
    this.serviceName = serviceName;
    this.serviceDuration = serviceDuration;
    this.servicePrice = servicePrice;
  }

  toMap() {
    return {
      'nameCustomer': this.nameCustomer,
      'employeeId': this.employeeId,
      'date': this.date,
      'hour': this.hour,
      'concluded': this.concluded,
      'thumbnailCustomer': this.thumbnailCustomer,
      'nameEmployee': this.nameEmployee,
      'customerId': this.customerId,
      'serviceName': this.serviceName,
      'servicePrice': this.servicePrice,
      'serviceDuration': this.serviceDuration
    };
  }
}
