import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:breathy/feature/air_quality/component/aq_bottom_sheet.dart';
import 'package:breathy/widget/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../widget/gradient_bar.dart';

class AirQualityScreen extends StatefulWidget {
  AirQualityScreen({Key? key}) : super(key: key);

  @override
  State<AirQualityScreen> createState() => _AirQualityScreenState();
}

class _AirQualityScreenState extends State<AirQualityScreen> {
  List<Color> filterColor = [
    Colors.yellow,
    Colors.lightBlueAccent,
    Colors.green,
  ];

  int filterIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SwipeDetector(
      onSwipeUp: ((_) => aqBottomSheet(context)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            right: -620,
            bottom: 0,
            child: filterIndex == 2
                ? Image.asset(
                    "assets/images/bg-no2.jpg",
                    scale: 1.25,
                    fit: BoxFit.fitHeight,
                  )
                : Image.asset(
                    "assets/images/bg-satellite.jpg",
                    color: filterColor[filterIndex],
                    scale: 1.25,
                    colorBlendMode: BlendMode.colorBurn,
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
                      child: "Air Quality".text.xl3.bold.white.make()),
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
                      width: 30,
                      child: "O₂".text.black.makeCentered(),
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
                      width: 30,
                      child: "CO₂".text.black.makeCentered(),
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
                      // setState(() {
                      //   filterIndex = 2;
                      // });
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Upgrade to Premium'),
                          content: SizedBox(
                            height: 100,
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 60,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.amber, width: 2),
                                      borderRadius: BorderRadius.circular(16)),
                                  child: "300৳-\n1 month"
                                      .text
                                      .align(TextAlign.center)
                                      .makeCentered(),
                                ),
                                Container(
                                  height: 60,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.amber, width: 2),
                                      borderRadius: BorderRadius.circular(16)),
                                  child: "1500৳-\n6 month"
                                      .text
                                      .align(TextAlign.center)
                                      .makeCentered(),
                                ),
                                Container(
                                  height: 60,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.amber, width: 2),
                                      borderRadius: BorderRadius.circular(16)),
                                  child: "3000৳-\n12 month"
                                      .text
                                      .align(TextAlign.center)
                                      .makeCentered(),
                                ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  filterIndex = 2;
                                  Navigator.pop(context, 'Cancel');
                                });
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Badge(
                      badgeColor: Colors.transparent,
                      position: BadgePosition(top: -15, end: -15),
                      elevation: 0,
                      toAnimate: false,
                      badgeContent: Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.amber,
                      ),
                      child: Container(
                        height: 30,
                        width: 30,
                        child: "NO₂".text.black.makeCentered(),
                        decoration: BoxDecoration(
                          color:
                              filterIndex == 2 ? filterColor[2] : Colors.grey,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ).px(20),
            ],
          ),
          Positioned(
            bottom: 100,
            child: [
              "38"
                  .text
                  .size(100)
                  .white
                  .textBaseLine(TextBaseline.alphabetic)
                  .bold
                  .make(),
              "AQI".text.xl3.textBaseLine(TextBaseline.alphabetic).white.make()
            ].row(crossAlignment: CrossAxisAlignment.end),
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
