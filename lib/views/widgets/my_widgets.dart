import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget mySpaceHorizontal(double width) {
  return SizedBox(
    width: width,
  );
}

Widget mySpaceVertical(double height) {
  return SizedBox(
    height: height,
  );
}

Widget myText({txt, Color? myColor, double? size}) {
  return Text(
    '${txt}',
    style: TextStyle(
      color: myColor == null ? Colors.white : myColor,
      fontWeight: FontWeight.w400,
      fontSize: size != null ? size : 18,
    ),
  );
}

Widget myTextBold({txt, Color? myColor, double? size}) {
  return Text(
    '${txt}',
    style: TextStyle(
      color: myColor == null ? Colors.white : myColor,
      fontWeight: FontWeight.bold,
      fontSize: size != null ? size : 18,
    ),
  );
}

Widget myWeatherContainerV({temp, icon, time, isActive}) {
  return Container(
    height: Get.height * 0.20,
    width: Get.width * 0.2,
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.only(right: 10),
    decoration: BoxDecoration(
      color: isActive
          ? Color.fromARGB(255, 255, 255, 255).withOpacity(0.3)
          : Colors.transparent,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            myText(txt: '${temp}°C', size: 19),
          ],
        ),
        Image.network(
          icon,
          alignment: Alignment.center,
          width: Get.width * 0.15,
        ),
        mySpaceVertical(5),
        Center(child: myText(txt: time, size: 19)),
      ],
    ),
  );
}

Widget myWeatherContainerH({date, icon, temp}) {
  return Container(
    height: Get.height * 0.08,
    margin: EdgeInsets.only(right: 20, top: 0),
    decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        myText(txt: date, size: 19),
        Image.network(
          icon,
          alignment: Alignment.center,
          width: Get.width * 0.15,
        ),
        myText(txt: '${temp}°C', size: 19),
      ],
    ),
  );
}
