import 'package:flutter/material.dart';

import '../../const/colors.dart';

class CustomInput extends StatelessWidget {
  // final TextEditingController myController;
  final String lable;
  final String value;
  final bool isPassword;

  const CustomInput({
    Key? key,
    // required this.myController,
    required this.lable,
    required this.value,
    required this.isPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.only(left: 40),
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        color: AppColor.placeholderBg,
      ),
      child: TextFormField(
        // controller: myController,
        decoration: InputDecoration(
          hintText: value,
         hintStyle: const TextStyle(
                color: Colors.black,
              ),
          border: InputBorder.none,
          labelText: lable,
          // contentPadding: const EdgeInsets.only(
          //   top: 10,
          //   bottom: 10,
          // ),
        ),
        obscureText: isPassword,
        // initialValue: value,
        style: const TextStyle(
          fontSize: 14,
        ),
        
      ),
    );
  }
}
