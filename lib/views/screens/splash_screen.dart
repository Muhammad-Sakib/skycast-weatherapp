import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:weather_app/views/screens/homepage.dart';
import 'package:weather_app/views/widgets/my_widgets.dart';

import '../../controllers/weather_control.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  TodayWeatherController tW = Get.put(TodayWeatherController());
  int steps = 0;
  myFun() async {
    if (steps < 100) {
      Future.delayed(
        new Duration(milliseconds: 40),
        () {
          setState(() {
            steps++;
          });
        },
      ).then((value) {
        myFun();
      });
    } else {
      Get.to(() => HomePage());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    myFun();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                stops: [0.1, 0.8],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff47BFDF), Color(0xff4A91FF)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/1779/1779940.png',
              width: 150,
            ),
            myTextBold(txt: 'SkyCast', size: 30),
            mySpaceVertical(50),
            Container(
              width: 120,
              child: StepProgressIndicator(
                totalSteps: 100,
                currentStep: steps,
                size: 7,
                padding: 0,
                roundedEdges: Radius.circular(2),
                selectedGradientColor: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 1, 175, 255),
                    Color.fromARGB(255, 1, 255, 192),
                  ],
                ),
                unselectedGradientColor: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.white, Colors.white],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
