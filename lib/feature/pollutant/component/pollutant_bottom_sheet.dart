import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../widget/bottom_sheet.dart';
import '../../../widget/gradient_bar.dart';

Future<void> pollutantBottomSheet(BuildContext context) {
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
                "Pollutant Elements of air :".text.xl2.bold.make(),
                10.heightBox,
                SizedBox(
                  width: context.percentWidth * 80,
                  child: [
                    RichText(
                        text: TextSpan(children: [
                      WidgetSpan(child: "PM 2.5: ".text.xl.bold.make()),
                      WidgetSpan(child: "10 μg/m³".text.xl.make()),
                    ])).pOnly(bottom: 16),
                    RichText(
                        text: TextSpan(children: [
                      WidgetSpan(child: "Sulfur Dioxide: ".text.xl.bold.make()),
                      WidgetSpan(child: "0.002%".text.xl.make()),
                    ])).pOnly(bottom: 16),
                  ].column(crossAlignment: CrossAxisAlignment.start),
                ),
              ],
            ),
          ).pOnly(top: 24),
        ),
      ],
    ),
    height: context.percentHeight * 40,
  );
}
