import 'package:flutter/material.dart';

class AppStyles {
  static Color getBackgrounfColor(BuildContext context) {
    return const Color(0xFF0F102B);
  }

  static Color getIconColor(BuildContext context) {
    return const Color(0xFFAFB4DF);
  }

  static Color getYellowColor(BuildContext context) {
    return const Color(0xFFFFD233);
  }

  static Color getWhiteColor(BuildContext context) {
    return const Color(0xFFFFFFFF);
  }

  static Color getGreenColor(BuildContext context) {
    return const Color(0xFF4FDD4C);
  }

  static Color getGreyColor(BuildContext context) {
    return const Color(0xFFB2B8C3);
  }

  static const _blackPrimaryValue = 0xFF0F102B;

  static const MaterialColor background = MaterialColor(
    _blackPrimaryValue,
    <int, Color>{
      50: Color(0xFFe0e0e0),
      100: Color(0xFFb3b3b3),
      200: Color(0xFF808080),
      300: Color(0xFF4d4d4d),
      400: Color(0xFF262626),
      500: Color(_blackPrimaryValue),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    },
  );

  static const MaterialColor foreground = MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFe0e0e0),
      100: Color(0xFFb3b3b3),
      200: Color(0xFF808080),
      300: Color(0xFF4d4d4d),
      400: Color(0xFF262626),
      500: Color(_blackPrimaryValue),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    },
  );
}
