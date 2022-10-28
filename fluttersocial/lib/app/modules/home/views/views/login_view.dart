import 'package:flutter/material.dart';
import 'package:fluttersocial/app/data/constants/assets.dart';
import 'package:fluttersocial/app/data/constants/strings.dart';
import 'package:fluttersocial/app/data/utils/app_style.dart';
import 'package:fluttersocial/app/data/utils/my_gradient.dart';
import 'package:fluttersocial/app/data/widgets/app_inputs.dart';
import 'package:fluttersocial/app/data/widgets/app_text.dart';
import 'package:fluttersocial/app/modules/home/controllers/auth_controller_controller.dart';
import 'package:fluttersocial/app/modules/home/painter_model.dart';

import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final AuthControllerController authControllerController =
      Get.put(AuthControllerController());

  late TextEditingController textEditingControllerNom =
      TextEditingController(text: "");
  late TextEditingController textEditingControllerPrenom =
      TextEditingController(text: "");
  late TextEditingController textEditingControllerEmail =
      TextEditingController(text: "");
  late TextEditingController textEditingControllerPassword =
      TextEditingController(text: "");
  late PageController pageController = PageController();

  @override
  void initStae() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppStyles.getYellowColor(context),
      body: SingleChildScrollView(
        child: InkWell(
          onTap: () {
            Focus.of(context).requestFocus(FocusNode());
          },
          child: Container(
            decoration: MyGradient(
                startColor: AppStyles.getWhiteColor(context),
                endColor: AppStyles.getYellowColor(context)),
            margin: EdgeInsets.symmetric(
                horizontal: width * .01, vertical: height * .02),
            width: width,
            height: height > 700.0 ? height : 700,
            child: SafeArea(
                child: Column(
              children: [
                Image.asset(
                  AssetData.dakBee,
                  color: Colors.blue,
                  width: width * 6,
                  height: height / 5,
                ),
                SizedBox(
                  height: height * .08,
                ),
                lordOrCreateButton(width: width, height: height * .07),
                SizedBox(
                  height: height * .08,
                ),
                Expanded(
                  flex: 2,
                  child: PageView(
                    clipBehavior: Clip.none,
                    physics: const BouncingScrollPhysics(),
                    controller: pageController,
                    children: [
                      login(),
                      register(),
                    ],
                  ),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }

  Widget lordOrCreateButton({width, height}) {
    return Container(
      decoration: MyGradient(
          startColor: AppStyles.getYellowColor(context),
          endColor: AppStyles.getWhiteColor(context),
          horizontal: true),
      width: width ?? 300,
      height: height ?? 50,
      child: CustomPaint(
        painter: MyPainter(pageController: pageController),
        child: Row(
          children: [btn(StringData.seConnecter), btn(StringData.creerCompte)],
        ),
      ),
    );
  }

  Widget btn(String name) {
    return Expanded(
        child: TextButton(
            onPressed: () {
              int page = pageController.page == 0.0 ? 1 : 0;
              pageController.animateToPage(page,
                  duration: Duration(microseconds: 500),
                  curve: Curves.bounceInOut);
            },
            child: AppText(
              name,
              color: Colors.black,
              size: 20.0,
              weight: FontWeight.bold,
            )));
  }

  Widget register() {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText(
              StringData.nom,
              size: 25.0,
              weight: FontWeight.bold,
            ),
            AppInput(
              hasSuffix: false,
              controller: textEditingControllerNom,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                }
                return "Veuillez remplit tous les champs";
              },
              hint: StringData.nomExemple,
              inputType: TextInputType.text,
              label: StringData.nom,
            ),
            const SizedBox(
              height: 30.0,
            ),
            AppText(
              StringData.prenom,
              size: 25.0,
              weight: FontWeight.bold,
            ),
            AppInput(
              hasSuffix: false,
              controller: textEditingControllerPrenom,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                }
                return "Veuillez remplit tous les champs";
              },
              hint: StringData.prenomExemle,
              inputType: TextInputType.text,
              label: StringData.prenom,
            ),
            const SizedBox(
              height: 30.0,
            ),
            AppText(
              StringData.mail,
              size: 25.0,
              weight: FontWeight.bold,
            ),
            AppInput(
              hasSuffix: false,
              controller: textEditingControllerEmail,
              validator: (value) {
                if (value != null && value.isEmail) {
                  return null;
                } else {
                  return "Le mail est invalide";
                }
              },
              hint: StringData.mailExemple,
              inputType: TextInputType.text,
              label: StringData.mail,
            ),
            const SizedBox(
              height: 30.0,
            ),
            AppText(
              StringData.password,
              size: 25.0,
              weight: FontWeight.bold,
            ),
            AppInput(
              hasSuffix: false,
              controller: textEditingControllerPassword,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                }
                return "Veuillez remplit tous les champs";
              },
              hint: StringData.passwordExemple,
              inputType: TextInputType.text,
              label: StringData.password,
            ),
            const SizedBox(
              height: 50.0,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                    onPressed: () {
                      if (verificationRegister()) {
                        authControllerController
                            .register(textEditingControllerEmail.text,
                                textEditingControllerPassword.text,
                                name: textEditingControllerNom.text,
                                surname: textEditingControllerPrenom.text)
                            .then((value) => {
                                  if (value)
                                    {
                                      Get.snackbar("Information",
                                          "Your enregistrement is successful",
                                          backgroundColor: Colors.green,
                                          colorText: Colors.black)
                                    }
                                  else
                                    {
                                      authControllerController.snackbarInfo(
                                          "Error", "Registment failed")
                                    }
                                });
                      }
                    },
                    child: AppText(
                      StringData.crer,
                      size: 20.0,
                      weight: FontWeight.bold,
                    )),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget login() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            StringData.mail,
            size: 25.0,
            weight: FontWeight.bold,
          ),
          AppInput(
            hasSuffix: false,
            controller: textEditingControllerEmail,
            validator: (value) {
              if (value != null && value.isEmail) {
                return null;
              } else {
                return "Le mail est invalide";
              }
            },
            hint: StringData.mailExemple,
            inputType: TextInputType.text,
            label: StringData.mail,
          ),
          const SizedBox(
            height: 30.0,
          ),
          AppText(
            StringData.password,
            size: 25.0,
            weight: FontWeight.bold,
          ),
          AppInput(
            hasSuffix: false,
            controller: textEditingControllerPassword,
            validator: (value) {
              if (value != null && value.isNotEmpty) {
                return null;
              }
              return "Le champ du mot de passe est null";
            },
            hint: StringData.passwordExemple,
            inputType: TextInputType.text,
            label: StringData.password,
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Padding(
              padding: const  EdgeInsets.symmetric(horizontal: 10.0),
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                  onPressed: () {
                    authControllerController.logIn(
                        textEditingControllerEmail.text,
                        textEditingControllerPassword.text);
                    // Get.snackbar("Information",
                    //     "Vous voulez vous-connecté,avez-vous un compte fonctionnelle?",
                    //     snackPosition: SnackPosition.TOP,
                    //     backgroundColor: Colors.red,
                    //     colorText: Colors.black);
                  },
                  child: AppText(
                    StringData.connect,
                    size: 20.0,
                    weight: FontWeight.bold,
                  )),
            ),
          )
        ],
      ),
    );
  }

  bool verificationRegister() {
    if (textEditingControllerEmail.text.isEmail &&
        textEditingControllerNom.text.isNotEmpty &&
        textEditingControllerPassword.text.isNotEmpty &&
        textEditingControllerPrenom.text.isNotEmpty) return true;
    return false;
  }
}
