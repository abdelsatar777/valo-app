import 'package:flutter/cupertino.dart';

abstract class IsTablet {
  static bool isTablet(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final shortestSide = size.shortestSide;
    return shortestSide >= 600; // تابلت عادة من 600 وطالع
  }
}
