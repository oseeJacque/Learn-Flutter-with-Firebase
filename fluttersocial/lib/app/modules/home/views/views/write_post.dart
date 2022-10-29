import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttersocial/app/data/constants/strings.dart';
import 'package:fluttersocial/app/data/utils/app_style.dart';
import 'package:fluttersocial/app/data/utils/constants.dart';
import 'package:fluttersocial/app/data/utils/my_gradient.dart';
import 'package:fluttersocial/app/data/widgets/app_inputs.dart';
import 'package:fluttersocial/app/data/widgets/app_text.dart';

class WritePost extends StatefulWidget {
  //String memberId;

  // WritePost({@required this.memberId});
  @override
  State<StatefulWidget> createState() => WriteState();
}

class WriteState extends State<WritePost> {
  late TextEditingController _controller;
  late File _imageFile;

  @override
  void initState() {
    _controller = TextEditingController();
    _imageFile = File(" ");
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        decoration: MyGradient(
            startColor: AppStyles.getGreyColor(context),
            endColor: AppStyles.getYellowColor(context),
            radius: 50.0),
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width,
        child: InkWell(
          onTap: (() {
            FocusScope.of(context).requestFocus(FocusNode());
          }),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(
                StringData.newPost,
                weight: FontWeight.bold,
                color: Colors.black,
                size: 20.0,
              ),
              SizedBox(height: height * .04),
              AppInput(
                hasSuffix: false,
                controller: _controller,
                validator: (value) {},
                hint: StringData.writeSomething,
                inputType: TextInputType.multiline,
              ),
              SizedBox(height: height * .04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: () {}, icon: cameraIcon),
                  IconButton(onPressed: () {}, icon: libraryIcon)
                ],
              ),
              SizedBox(height: height * .04),
              Container(
                child: (_imageFile == null || _imageFile.path.isEmpty)
                    ? AppText(StringData.noImage)
                    : Image.file(_imageFile),
              ),
              Card(
                elevation: 7.5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: MyGradient(
                      startColor: AppStyles.getGreenColor(context),
                      endColor: AppStyles.getGreyColor(context),
                      radius: 25,
                      horizontal: true),
                  child: TextButton(
                    child: Text("Envoyer"),
                    onPressed: () {
                      //envoyer à Firebase
                      //sendToFirebase();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // takePicture(ImageSource source) async {
  //   final imagePath = await ImagePicker().getImage(source: source, maxHeight: 500, maxWidth: 500);
  //   final file = File(imagePath.path);
  //   setState(() {
  //     _imageFile = file;
  //   });
  // }

  // sendToFirebase() {
  //   FocusScope.of(context).requestFocus(FocusNode());
  //   Navigator.pop(context);
  //   if ((_imageFile != null) || (_controller.text != null && _controller.text != "")) {
  //     FirebaseHandler().addPostToFirebase(widget.memberId, _controller.text, _imageFile);
  //   }
  // }
}
