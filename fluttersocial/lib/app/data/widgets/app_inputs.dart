
import 'package:flutter/material.dart';
import 'package:fluttersocial/app/data/utils/app_style.dart';

class AppInput extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final double height;
  final TextInputType inputType;
  final TextAlign textAlign;
  final bool isObscure;
  final IconButton suffixIcon;
  final String hint;
  final bool hasSuffix;
  final bool radius;
  final int maxLine;
  final int minLine;
  //final InputDecoration decoration;

  const AppInput({
    Key? key,
    this.label = "",
    required this.hasSuffix,
    required this.controller,
    required this.validator,
    this.height = 55,
    this.inputType = TextInputType.text,
    this.isObscure = false,
    this.suffixIcon = const IconButton(
      icon: Icon(Icons.edit),
      onPressed: null,
    ),
    this.textAlign = TextAlign.start,
    this.hint = "",
    this.radius = true,
    this.maxLine = 1,
    this.minLine = 1,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextFormField(
        decoration: InputDecoration(
          hintStyle: TextStyle(color: AppStyles.getGreyColor(context)),
          suffixIcon: hasSuffix ? suffixIcon : null,
          suffixIconColor: AppStyles.getWhiteColor(context),
          hintText: hint,
          focusColor: AppStyles.getWhiteColor(context),
          iconColor: AppStyles.getWhiteColor(context),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: AppStyles.getWhiteColor(context))),
          errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          focusedBorder: radius
              ? UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: AppStyles.getWhiteColor(context)))
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  //<-- SEE HERE
                  borderSide: BorderSide(
                      width: 3, color: AppStyles.getWhiteColor(context)),
                ),
          focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppStyles.getWhiteColor(context))),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppStyles.getWhiteColor(context))),
        ),
        obscureText: isObscure,
        keyboardType: inputType,
        controller: controller,
        maxLines: maxLine,
        validator: validator,
        textAlign: textAlign,
        style: TextStyle(fontSize: 16, color: AppStyles.getWhiteColor(context)),
        minLines: 1,
        
      ),
    );
  }
}