
import 'package:flutter/material.dart';

class RMUtil {

  static const baseWidth = 414.0;
  static const baseHeight = 896.0;
  static Size size;

  static double width(double value, BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    double resoulationDiffernece = baseWidth / screenSize.width;
    double actualWidth = value / resoulationDiffernece;

    return actualWidth;
  }

  static double height(double value, BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    double resoulationDiffernece = baseHeight / screenSize.height;
    double actualHeight = value / resoulationDiffernece;

    return actualHeight;
  }
}
