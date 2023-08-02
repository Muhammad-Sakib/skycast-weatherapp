import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controllers/weather_control.dart';

import '../../utilities/global.dart';
import '../widgets/my_widgets.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key});

  ForecastWeatherController fWC = Get.put(ForecastWeatherController());
  var date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    String dateStr = "${months[date.month - 1]}, ${date.day}";

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 25, right: 25),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                stops: [0.1, 0.8],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff47BFDF), Color(0xff4A91FF)])),
        height: Get.height,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.arrow_back_ios),
                    mySpaceHorizontal(10),
                    myText(txt: 'Back', size: 20),
                  ],
                ),
                Icon(Icons.settings_outlined),
              ],
            ),
            mySpaceVertical(Get.height * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                myTextBold(txt: 'Today', size: 21),
                myText(
                  txt: dateStr,
                ),
              ],
            ),
            mySpaceVertical(Get.height * 0.02),
            Container(
              width: Get.width,
              height: Get.height * 0.20,
              margin: EdgeInsets.only(top: Get.height * .02),
              child: Obx(
                () => ListView.builder(
                  itemCount: fWC.todayWeatherData.value.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return myWeatherContainerV(
                        temp: fWC.todayWeatherData.value[index]["temp"],
                        icon: fWC.todayWeatherData.value[index]["icon"],
                        time: fWC.todayWeatherData.value[index]["time"],
                        isActive: int.parse(fWC
                                    .todayWeatherData.value[index]["time"]
                                    .toString()
                                    .split(':')[0]) ==
                                date.hour
                            // fWC.todayWeatherData.value[index]["time"]
                            //     .toString()[1]
                            //     .contains(date.hour.toString()[1])
                            ? true
                            : false);
                  },
                ),
              ),
            ),
            mySpaceVertical(Get.height * 0.05),
            myTextBold(txt: 'Next Forecast', size: 21),
            Container(
                height: Get.height * 0.45,
                width: Get.width,
                decoration: BoxDecoration(),
                child: Obx(
                  () => ListView.builder(
                    itemCount: fWC.forecastWeatherData.value.length,
                    itemBuilder: (context, index) {
                      return myWeatherContainerH(
                        temp: '${fWC.forecastWeatherData.value[index]['temp']}',
                        icon: '${fWC.forecastWeatherData.value[index]['icon']}',
                        date: '${fWC.forecastWeatherData.value[index]['date']}',
                      );
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
