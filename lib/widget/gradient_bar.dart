import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class GradientBar extends StatelessWidget {
  int value = 0;
  GradientBar({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      width: context.percentWidth * 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 24,
            width: context.percentWidth * 80,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                  Colors.green,
                  Colors.yellow,
                  Colors.red,
                ])),
          ).pOnly(top: 24),
          Positioned(
            left: value * 3.25,
            child: Container(
              height: 32,
              width: 5,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(color: Colors.black26, spreadRadius: 1)
              ]),
            ).pOnly(top: 24),
          ),
          Positioned(
              top: 0,
              child: SizedBox(
                height: 30,
                width: context.percentWidth * 100,
                child: Row(
                  children: [
                    "Safe".text.xl.black.make().pOnly(left: 50),
                    Spacer(),
                    "Danger".text.xl.black.make().pOnly(right: 50),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
