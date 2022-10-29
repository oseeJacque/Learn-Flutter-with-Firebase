import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttersocial/app/data/constants/firebase_constant.dart';
import 'package:fluttersocial/app/data/utils/app_style.dart';
import 'package:fluttersocial/app/modules/home/views/home_view.dart';
import 'package:fluttersocial/app/modules/home/views/views/login_view.dart';
import 'package:get/get.dart';

import '../../../data/utils/constants.dart';

class AuthControllerController extends GetxController {
  //TODO: Implement AuthControllerController
  static AuthControllerController instance = Get.find();
  late Rx<User?> firebaseUser;
  final fire_user = fireStoreInstance.collection(memberRef);
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
      Get.offAll(() => const LoginView());
    } else {
      //When user will be ampty
      Get.offAll(() => HomeView(
            memberUid: firebaseUser.value!.uid,
          ));
    }
  }

  Future<bool> register(String mail, String password,
      {name = "SOKE", surname = "Osée"}) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
          email: mail, password: password);
      final User? user = userCredential.user;
      Map<String, dynamic> memberMap = {
        nameKey: name,
        surnameKey: surname,
        imageUrlKey: "",
        followersKey: [user!.uid],
        followingKey: [],
        uidKey: user.uid
      };
      addUserToFireBase(memberMap);
      if (userCredential.additionalUserInfo!.isNewUser) return true;
      return false;
    }
    //Here we can return or display a dialogue to show the exeption of firebase
    //The exception can be "No valide mail or password"
    on FirebaseException catch (e) {
      snackbarInfo("Error ", e.message.toString());
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future logIn(String mail, String password) async {
    try {
      final response = await auth.signInWithEmailAndPassword(
          email: mail, password: password);
      if (response.user!.emailVerified) {
        snackbarInfo("Connexion", response.additionalUserInfo.toString());
      } else {
        snackbarInfo("Erreur", "Vous ne disposez pas de compte");
      }
    } on FirebaseException catch (e) {
      snackbarInfo("Erreur", e.message.toString());
      print(e.message.toString());
    } catch (e) {}
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

  addUserToFireBase(Map<String, dynamic> map) {
    fire_user.doc(map[uidKey]).set(map);
  }

  snackbarInfo(String title, String message) {
    return Get.snackbar(title, message,
        snackPosition: SnackPosition.TOP,
        colorText: Colors.black,
        backgroundColor: Colors.red,
        animationDuration: const Duration(milliseconds: 4000));
  }
}
