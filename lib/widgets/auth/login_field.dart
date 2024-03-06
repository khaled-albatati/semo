import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class LoginField extends StatelessWidget {
  final String hintText;
  final String lableText;
  final IconData iconData;
  final TextEditingController myController;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTapIcon;

  const LoginField({
    super.key,
    required this.hintText,
    required this.lableText,
    required this.iconData,
    required this.myController,
    required this.valid,
    required this.isNumber,
    this.obscureText,
    this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: isNumber
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      validator: valid,
      controller: myController,
      obscureText: obscureText == null || obscureText == false ? false : true,
      decoration: InputDecoration(
          hintText: hintText,
          labelStyle: const TextStyle(
            color: AppColor.cyan,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          // focusColor: Colors.amber,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          label: Text(lableText), // Email
          suffixIcon: InkWell(
            onTap: onTapIcon,
            child: Icon(
              iconData,
              color: AppColor.cyan,
            ),
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
