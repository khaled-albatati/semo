import 'package:flutter/material.dart';
// import 'package:get/get_utils/get_utils.dart';
// import '../../../core/constant/color.dart';

class CustomTextLog extends StatelessWidget {
  final void Function() onTap;
  final String textone;
  final String texttwo;
  final Color color;
  const CustomTextLog({super.key,required this.onTap, required this.textone, required this.texttwo, required this.color});

  @override
  Widget build(BuildContext context) {
    return  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$textone "), //"dont have an account?"
                InkWell(
                  onTap: onTap,
                  child: Text(
                    texttwo,
                    style:  TextStyle(
                      color: color,
                    ),
                  ), //sign up
                )
              ],
            );
  }
}