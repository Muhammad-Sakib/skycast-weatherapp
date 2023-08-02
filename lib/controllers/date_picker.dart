import 'package:weather_app/models/date_model.dart';

String date() {
  var date = DateTime.now();
  DateModel dm = DateModel(date.day, date.month);
  return "Today, ${dm.day} ${dm.month}";
}
