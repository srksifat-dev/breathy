import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../widget/bottom_sheet.dart';
import '../../../widget/gradient_bar.dart';

Future<void> aqBottomSheet(BuildContext context) {
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
                [
                  "Air Quality Index"
                      .text
                      .xl3
                      .textBaseLine(TextBaseline.alphabetic)
                      .black
                      .make(),
                  "38"
                      .text
                      .size(100)
                      .black
                      .textBaseLine(TextBaseline.alphabetic)
                      .bold
                      .make(),
                ].column().pOnly(top: 24),
                GradientBar(value: 30),
                10.heightBox,
                Divider(
                  thickness: 1,
                  indent: 16,
                  endIndent: 16,
                ),
                "Elements of air :".text.xl2.bold.make(),
                10.heightBox,
                SizedBox(
                  width: context.percentWidth * 80,
                  child: [
                    RichText(
                        text: TextSpan(children: [
                      WidgetSpan(
                          child: "Carbon Monoxide: ".text.xl.bold.make()),
                      WidgetSpan(child: "80%".text.xl.make()),
                    ])).pOnly(bottom: 16),
                    RichText(
                        text: TextSpan(children: [
                      WidgetSpan(child: "Sulfur Dioxide: ".text.xl.bold.make()),
                      WidgetSpan(child: "80%".text.xl.make()),
                    ])).pOnly(bottom: 16),
                    RichText(
                        text: TextSpan(children: [
                      WidgetSpan(
                          child: "Nitrogen Dioxide: ".text.xl.bold.make()),
                      WidgetSpan(child: "80%".text.xl.make()),
                    ])).pOnly(bottom: 16),
                    RichText(
                        text: TextSpan(children: [
                      WidgetSpan(
                          child: "Ground level Ozone: ".text.xl.bold.make()),
                      WidgetSpan(child: "80%".text.xl.make()),
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
