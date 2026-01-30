import 'package:flutter/material.dart';

class AppColor {
  static const Color mainColor = Color.fromARGB(255, 24, 36, 45);
  static const Color primarycolor =Color(0xFFFC6011);
  static const Color secondrycolor = Colors.greenAccent;
  static const Color thirdcolor = Color.fromARGB(255, 5, 196, 221);
  static const Color brandcolor = Color.fromARGB(255, 5, 196, 221);
  static const Color backgroundColor = Color.fromRGBO(36, 46, 56, 1);
  static const Color backgroundColor1 = Color.fromRGBO(35, 81, 126, 1);
  static const Color backgroundColor12 = Color.fromRGBO(228, 235, 243, 1);
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;
  static const Color white = Colors.white;
  static const Color cyan = Color.fromARGB(255, 0, 150, 170);
  static const Color transpate = Color.fromARGB(0, 0, 0, 0);
  static const Color notification = Color.fromARGB(255, 252, 255, 63);
   static const orange = Color(0xFFFC6011);
  static final s = List<Color>.from([Colors.accents, Colors.amber]);

  //mixed color :
  static const LinearGradient mixed1 =
      LinearGradient(colors: [primarycolor, secondrycolor]);

  static Shader linearGradient =
      const LinearGradient(colors: <Color>[(primarycolor), (secondrycolor)])
          .createShader(const Rect.fromLTWH(0, 0, 0, 0));
}


//title: Text(
          //   "Categories",
          //   style: TextStyle(
          //       foreground: Paint()..shader = AppColor.linearGradient),
          // )
