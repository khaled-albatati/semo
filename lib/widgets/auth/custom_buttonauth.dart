import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth({super.key, required this.text, this.onPressed, required this.color});
  final String text;
  final Color color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child:MaterialButton(
        color: color,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
      // padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 2),
      // textColor: Colors.white,
      // color: AppColor.primarycolor,
      child: Text(text),),
    );
  }
}
