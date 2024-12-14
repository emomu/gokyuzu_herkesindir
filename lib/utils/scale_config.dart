import 'package:flutter/widgets.dart';

class ScaleConfig {
  static double scaleFactor = 0.0;

  static void init(BuildContext context, {double baseWidth = 430}) {
    double screenWidth = MediaQuery.of(context).size.width;
    scaleFactor = screenWidth / baseWidth;
  }
}
