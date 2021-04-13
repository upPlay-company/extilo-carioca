class Notify {
  String type;
  String customerName;
  DateTime date;
  int price;
  int hour;

  Notify({String type, String customerName, DateTime date, int hour, int price}) {
    this.type = type;
    this.customerName = customerName;
    this.date = date;
    this.hour = hour;
    this.price = price;
  }

  toMap() {
    return {
      'pid': this.type,
      'customerName': this.customerName,
      'date': this.date,
      'hour': this.hour,
      'price': this.price,
    };
  }
}
