class TodayWeatherModel {
  int? temp;
  int? humidity;
  int? wind;
  String? status;
  String? icon;
  TodayWeatherModel(
      double temp, double wind, int humidity, String status, String icon) {
    this.temp = temp.toInt();
    this.humidity = humidity;
    this.wind = wind.toInt();
    this.status = status;
    this.icon = icon;
  }
}
// class ForecastWeatherModel {
//   List<String> todayWeather;
//   List<String> 
// }
