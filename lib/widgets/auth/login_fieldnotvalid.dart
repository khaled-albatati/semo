import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginFieldNotValid extends StatelessWidget {
  final String hintText;
  final String validator;
  final String lableText;
  final IconData iconData;
  final TextEditingController myController;
 
  const LoginFieldNotValid({
    super.key,
    required this.hintText,
    required this.lableText,
    required this.iconData,
    required this.myController,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: MultiValidator([
        RequiredValidator(errorText: validator),
      ]),
      controller: myController,
      decoration: InputDecoration(
          hintText: hintText,
          labelStyle: const TextStyle(
            color: AppColor.cyan,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          // focusColor: Colors.amber,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          label: Text(lableText), // Email
          suffixIcon: Icon(
            iconData,
            color: AppColor.cyan,
          ),
          // border: OutlineInputBorder(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColor.cyan,
              ),
              borderRadius: BorderRadius.circular(30))),
    );
  }
}
