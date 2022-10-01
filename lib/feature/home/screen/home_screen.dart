import 'package:breathy/feature/air_quality/screen/air_quality_screen.dart';
import 'package:breathy/feature/pollutant/screen/pollutant_screen.dart';
import 'package:breathy/feature/weather/screen/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Color> colors = [Colors.amber, Colors.purple, Colors.blue];

  final List pages = [
    AirQualityScreen(),
    PollutantScreen(),
    WeatherScreen(),
  ];

  void handleClick(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.pop(context);
        break;
      case 1:
        break;
    }
  }

  bool visibility = true;

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    String greeting = "";

    if (5 <= now.hour && now.hour < 12) {
      greeting = "Good Morning 🌅";
    } else if (now.hour == 12) {
      greeting = "Good Noon ☀";
    } else if (now.hour > 12 && now.hour < 17) {
      greeting = "Good Afternoon";
    } else if (17 <= now.hour && now.hour < 21) {
      greeting = "Good Evening 🌆";
    } else if (21 <= now.hour || now.hour < 5) {
      greeting = "Good Night 🌙";
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: "Breathy".text.black.make(),
          backgroundColor: Colors.white,
          actions: [
            PopupMenuButton<int>(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              offset: Offset(-30, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              onSelected: (item) => handleClick(context, item),
              itemBuilder: (context) => [
                PopupMenuItem<int>(value: 0, child: Text('Logout')),
                PopupMenuItem<int>(value: 1, child: Text('Settings')),
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              width: context.percentWidth * 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Hi, Alex".text.xl2.bold.make(),
                  greeting.text.xl2.make()
                ],
              ).p(16),
            ),
            // Visibility(
            //   maintainAnimation: true,
            //   maintainState: true,
            //   visible: visibility,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           "Hi, Alex".text.xl2.bold.make(),
            //           greeting.text.xl2.make()
            //         ],
            //       ).p(16),
            //       IconButton(
            //           onPressed: () {
            //             setState(() {
            //               visibility = false;
            //             });
            //           },
            //           icon: Icon(
            //             Icons.close,
            //             color: Colors.red,
            //           ))
            //     ],
            //   ),
            // ),
            Expanded(
              child: PageView.builder(
                  itemCount: 3, itemBuilder: (context, index) => pages[index]),
            ),
          ],
        ),
      ),
    );
  }
}
