import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:breathy/feature/air_quality/component/aq_bottom_sheet.dart';
import 'package:breathy/feature/pollutant/component/pollutant_bottom_sheet.dart';
import 'package:breathy/widget/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../widget/gradient_bar.dart';

class PollutantScreen extends StatefulWidget {
  PollutantScreen({Key? key}) : super(key: key);

  @override
  State<PollutantScreen> createState() => _PollutantScreenState();
}

class _PollutantScreenState extends State<PollutantScreen> {
  List<Color> filterColor = [
    Colors.yellow,
    Colors.lightBlueAccent,
    Colors.green,
  ];

  int filterIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SwipeDetector(
      onSwipeUp: ((_) => pollutantBottomSheet(context)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            right: -620,
            bottom: 0,
            child: filterIndex == 0
                ? Image.asset(
                    "assets/images/bg-co.jpg",
                    scale: 1.25,
                    fit: BoxFit.fitHeight,
                  )
                : filterIndex == 1
                    ? Image.asset(
                        "assets/images/bg-dust.jpg",
                        scale: 1.25,
                        fit: BoxFit.fitHeight,
                      )
                    : Image.asset(
                        "assets/images/bg-so2.jpg",
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
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  SizedBox(
                      width: context.percentWidth * 35,
                      child: "Pollutant".text.xl3.bold.white.make()),
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
                crossAxisAlignment: CrossAxisAlignment.end,
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
                      child: "CO".text.black.makeCentered(),
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
                      width: 50,
                      child: "Dust".text.black.makeCentered(),
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
                        width: 40,
                        child: "SO₂".text.black.makeCentered(),
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
