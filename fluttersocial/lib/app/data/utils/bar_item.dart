import 'package:flutter/material.dart';
import 'package:fluttersocial/app/data/utils/app_style.dart';


class BarItem extends IconButton {
  BarItem({
    required Icon icon,
    required VoidCallback onPressed,
    required bool selected
}): super(
    icon: icon,
    onPressed: onPressed,
    color: selected ?Colors.blue: Colors.white
  );
}