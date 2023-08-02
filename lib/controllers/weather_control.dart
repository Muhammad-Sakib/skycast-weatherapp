import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

import '../utilities/global.dart';
import 'location.dart';

class TodayWeatherController extends GetxController {
  // void weatherStatus() async {
  //   String key = "856822fd8e22db5e1ba48c0e7d69844a";
  //   currentLocation();
  //   WeatherFactory wf = new WeatherFactory(key);
  //   Weather w = await wf.currentWeatherByLocation(23.7542164, 90.3932905);
  //   print(w.areaName);
  //   print(w.temperature);
  // }
  RxString areaName = ''.obs;
  LocationController lc = LocationController();
  Rx<TodayWeatherModel> weather = (TodayWeatherModel(0, 0, 0, '', '')).obs;
  @override
  void onInit() async {
    super.onInit();
    try {
      await lc.setPosition().then((value) async {
        double lat = value[0];
        double lon = value[1];
        await todayWeather(lat, lon);
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> todayWeather(lat, lon) async {
    print(lat);
    print(lon);
    final response = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=2ed54ca8e156486998085230232507&q=${lat},${lon}'));

    if (response.statusCode == 200) {
      // print(json.decode(response.body));
      var weatherData = json.decode(response.body);

      areaName.value = weatherData['location']['name'];
      update([
        weather.value = TodayWeatherModel(
            weatherData['current']['temp_c'],
            weatherData['current']['wind_kph'],
            weatherData['current']['humidity'],
            weatherData['current']['condition']['text'],
            weatherData['current']['condition']['icon'])
      ]);
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class ForecastWeatherController extends GetxController {
  RxList todayWeatherData = [].obs;
  RxList forecastWeatherData = [].obs;
  LocationController lc = LocationController();
  @override
  void onInit() async {
    super.onInit();
    try {
      await lc.setPosition().then((value) async {
        double lat = value[0];
        double lon = value[1];
        await forecastWeather(lat, lon);
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> forecastWeather(lat, lon) async {
    print(lat);
    print(lon);
    String url =
        "https://api.weatherapi.com/v1/forecast.json?key=2ed54ca8e156486998085230232507&q=${lat},${lon}&days=7&aqi=no&alerts=no";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var weatherData = json.decode(response.body);
      List forcastData = weatherData['forecast']["forecastday"];
      List temp = forcastData[0]["hour"];
      // todayWeatherData.value.add({
      //   "date": '${month},${date.day}',
      // });
      for (var element in temp) {
        todayWeatherData.add({
          "time": element["time"].toString().split(' ')[1],
          "temp": element["temp_c"].toInt(),
          "icon": "https:${element["condition"]["icon"]}"
        });
      }
      // update([todayWeatherData]);
      // print(todayWeatherData);
      for (var i = 1; i < forcastData.length; i++) {
        List date = forcastData[i]["date"].toString().split('-');

        String month = months[int.parse(date[1]) - 1];
        forecastWeatherData.add({
          "date": "${month}, ${int.parse(date[2])}",
          "temp": forcastData[i]["day"]["maxtemp_c"].toInt(),
          "icon": "https:${forcastData[i]["day"]["condition"]["icon"]}"
        });
      }
      // print(forecastWeatherData);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
