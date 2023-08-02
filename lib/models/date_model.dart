import '../utilities/global.dart';

class DateModel {
  int? day;
  String? month;
  DateModel(int day, int month) {
    this.day = day;
    this.month = months[month - 1];
  }
}
