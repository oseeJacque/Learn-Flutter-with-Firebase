

import 'package:flutter/material.dart';
import 'package:fluttersocial/app/data/utils/app_style.dart';
import 'package:fluttersocial/app/modules/home/controllers/auth_controller_controller.dart';
import 'package:get/state_manager.dart';

class HomeView extends GetView<AuthControllerController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.getYellowColor(context),
    );
  }
}
