import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../widget/bottom_sheet.dart';
import '../../../widget/gradient_bar.dart';

Future<void> weatherBottomSheet(BuildContext context) {
  return bottomSheet(
    context: context,
    child: Column(
      children: [
        5.heightBox,
        Container(
          height: 5,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(5)),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                          child:
                              "Today's Average Temp.: ".text.xl2.bold.make()),
                      WidgetSpan(child: "36℃".text.xl2.make()),
                    ],
                  ),
                ).pOnly(bottom: 16),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                          child:
                              "Today's Maximum Temp.: ".text.xl2.bold.make()),
                      WidgetSpan(child: "37℃".text.xl2.make()),
                    ],
                  ),
                ).pOnly(bottom: 16),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                          child:
                              "Today's Minimum Temp.: ".text.xl2.bold.make()),
                      WidgetSpan(child: "35℃".text.xl2.make()),
                    ],
                  ),
                ).pOnly(bottom: 16),
              ],
            ),
          ).pOnly(top: 24),
        ),
      ],
    ),
    height: context.percentHeight * 40,
  );
}
