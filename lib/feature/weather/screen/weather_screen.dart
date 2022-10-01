import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:breathy/feature/air_quality/component/aq_bottom_sheet.dart';
import 'package:breathy/feature/weather/component/weather_bottom_sheet.dart';
import 'package:breathy/widget/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../widget/gradient_bar.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => WeatherScreenState();
}

class WeatherScreenState extends State<WeatherScreen> {
  List<Color> filterColor = [
    Colors.yellow,
    Colors.lightBlueAccent,
    Colors.green,
  ];

  int filterIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SwipeDetector(
      onSwipeUp: ((_) => weatherBottomSheet(context)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            right: -620,
            bottom: 0,
            child: filterIndex == 0
                ? Image.asset(
                    "assets/images/bg-temperature.jpg",
                    scale: 1.25,
                    fit: BoxFit.fitHeight,
                  )
                : filterIndex == 1
                    ? Image.asset(
                        "assets/images/bg-dew-point.jpg",
                        scale: 1.25,
                        fit: BoxFit.fitHeight,
                      )
                    : Image.asset(
                        "assets/images/bg-humidity.jpg",
                        scale: 1.25,
                        fit: BoxFit.fitHeight,
                      ),
          ),
          Positioned(
            top: 0,
            child: Container(
              height: 100,
              width: context.percentWidth * 100,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black,
                    Colors.transparent,
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(),
                  SizedBox(
                      width: context.percentWidth * 35,
                      child: "Weather".text.xl3.bold.white.make()),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ],
              ).pOnly(top: 16),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 200,
              width: context.percentWidth * 100,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black,
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        filterIndex = 0;
                      });
                    },
                    child: Container(
                      height: 30,
                      width: 80,
                      child: "Temperature".text.black.makeCentered(),
                      decoration: BoxDecoration(
                        color: filterIndex == 0 ? filterColor[0] : Colors.grey,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  10.heightBox,
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        filterIndex = 1;
                      });
                    },
                    child: Container(
                      height: 30,
                      width: 80,
                      child: "Dew Point".text.black.makeCentered(),
                      decoration: BoxDecoration(
                        color: filterIndex == 1 ? filterColor[1] : Colors.grey,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  10.heightBox,
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        filterIndex = 2;
                      });
                    },
                    child: Container(
                      height: 30,
                      width: 80,
                      child: "Humidity".text.black.makeCentered(),
                      decoration: BoxDecoration(
                        color: filterIndex == 2 ? filterColor[2] : Colors.grey,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ).px(20),
            ],
          ),
          Positioned(
            bottom: 20,
            child: Column(
              children: [
                Icon(
                  Icons.keyboard_arrow_up,
                  size: 40,
                  color: Colors.white,
                ),
                "Swipe Up to know more".text.xl.white.bold.make()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
