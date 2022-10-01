import 'package:flutter/material.dart';

Future<void> bottomSheet({
  required BuildContext context,
  required Widget child,
  Color color = Colors.white,
  required double height,
}) {
  return showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(height: height, color: color, child: child);
    },
  );
}
