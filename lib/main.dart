import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/views/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // determinePosition();
    // currentLocation();

    // date();
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.white),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
