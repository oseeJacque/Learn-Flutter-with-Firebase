import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttersocial/app/data/constants/firebase_constant.dart';
import 'package:fluttersocial/app/modules/home/controllers/auth_controller_controller.dart';
import 'package:fluttersocial/app/modules/home/views/home_view.dart';
import 'package:fluttersocial/app/modules/home/views/views/login_view.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp()
      .then((value) => Get.put(AuthControllerController()));

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: StreamBuilder<User?>(
      //   stream: auth.userChanges(),
      //   builder: (context, snapshot) {
      //     return (snapshot.hasData)
      //         ? HomeView(memberUid: snapshot.data!.uid)
      //         : LoginView();
      //   },
      //),
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
