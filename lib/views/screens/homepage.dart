import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controllers/weather_control.dart';
import 'package:weather_app/views/screens/detail.dart';
import 'package:weather_app/views/widgets/my_widgets.dart';

import '../../controllers/date_picker.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  String dateStr = date();

  TodayWeatherController tW = Get.put(TodayWeatherController());
  ForecastWeatherController fWC = Get.put(ForecastWeatherController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                stops: [0.1, 0.8],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff47BFDF), Color(0xff4A91FF)])),
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Obx(() => myText(
                          txt: '${tW.areaName.value}',
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.arrow_drop_down_sharp,
                      color: Colors.white,
                    ),
                  ],
                ),
                Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.white,
                )
              ],
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            Obx(() => SizedBox(
                  child: tW.weather.value.icon == ''
                      ? Icon(
                          Icons.cloud,
                          size: 130,
                        )
                      : Image.network(
                          'https:${tW.weather.value.icon}',
                          height: 150,
                          width: 150,
                          fit: BoxFit.fill,
                        ),
                )),
            SizedBox(
              height: Get.height * 0.05,
            ),
            InkWell(
              child: Container(
                padding: EdgeInsets.all(20),
                height: 350,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(61, 255, 255, 255),
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    myText(txt: '${dateStr}', size: 20),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Obx(() => Text(
                                "${tW.weather.value.temp}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 80),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0, left: 10),
                          child: Icon(
                            Icons.circle_outlined,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => myText(txt: '${tW.weather.value.status}', size: 20),
                    ),
                    mySpaceVertical(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.wind_power_outlined,
                        ),
                        mySpaceHorizontal(10),
                        myText(txt: 'Wind'),
                        mySpaceHorizontal(10),
                        myText(
                          txt: '|',
                        ),
                        mySpaceHorizontal(10),
                        Obx(
                          () => myText(
                            txt: '${tW.weather.value.wind}',
                          ),
                        ),
                        myText(txt: "km/h"),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.water_drop_outlined,
                        ),
                        mySpaceHorizontal(10),
                        myText(txt: 'Hum'),
                        mySpaceHorizontal(10),
                        myText(
                          txt: '|',
                        ),
                        mySpaceHorizontal(10),
                        Obx(
                          () => myText(
                            txt: '${tW.weather.value.humidity}%',
                          ),
                        ),
                        mySpaceHorizontal(30)
                      ],
                    ),
                  ],
                ),
              ),
              onTap: () => Get.to(DetailPage()),
            ),
          ],
        ),
      ),
    );
  }
}
