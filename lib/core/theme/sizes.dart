
import 'package:flutter/material.dart';


class ScreenSize {
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }
}

class Raidus {
  static double extraSmall =5.0;
  static double small = 8.0;
  static double regular = 10.0;
  static double medium = 20.0;
  static double large = 30.0;
  static double extraLarge = 55.0;
  static double exceptional = 60.0;
}

class Paddings {
  static double small = 5;
  static double regular = 10;
  static double medium = 15;
  static double large = 20;
  static double veryLarge = 25;
  static double exceptional = 30;
}
class Sizes {
  static  double x30 = 30;
  static  double x20 = 20;
  static  double x28 = 28;
  static  double x24 = 24;
  static  double x22 = 22;
  static  double x19 = 19;
  static  double x18 = 18;
  static  double x17 = 17;
  static  double x16 = 16;
  static  double x15 = 15;
  static  double x14 = 14;
  static  double x13 = 13;
  static  double x12 = 12;
  static  double x11 = 11;
  static  double x10 = 10;
  static  double x8 = 8;
  static  double x9 = 9;
}
class Constants {
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
}