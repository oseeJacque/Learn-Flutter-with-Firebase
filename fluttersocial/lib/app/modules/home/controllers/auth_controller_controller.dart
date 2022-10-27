import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttersocial/app/data/constants/firebase_constant.dart';
import 'package:fluttersocial/app/data/utils/app_style.dart';
import 'package:fluttersocial/app/modules/home/views/home_view.dart';
import 'package:fluttersocial/app/modules/home/views/views/login_view.dart';
import 'package:get/get.dart';

class AuthControllerController extends GetxController {
  //TODO: Implement AuthControllerController
  static AuthControllerController instance = Get.find();
  late Rx<User?> firebaseUser;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitializeScreem);
  }

  _setInitializeScreem(User? user) {
    if (user == null) {
      Get.offAll(() => const HomeView());
    } else {
      //When user will be ampty
      Get.offAll(() => const LoginView());
    }
  }

  void register(String mail, String password) {
    try {
      auth.signInWithEmailAndPassword(email: mail, password: password);
    }
    //Here we can return or display a dialogue to show the exeption of firebase
    //The exception can be "No valide mail or password"
    on FirebaseException catch (e) {
      print(e.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  void logIn(String mail, String password) {
    try {
      auth.signInWithEmailAndPassword(email: mail, password: password);
    } on FirebaseException catch (e) {
      print(e.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  void logOut() {
    try {
      auth.signOut();
    } on FirebaseException catch (e) {
      print(e.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  snackbarInfo(String title, String message) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.black,
        backgroundColor: Colors.yellow, 
        animationDuration: const Duration(microseconds: 1000)
        );
  }
}
