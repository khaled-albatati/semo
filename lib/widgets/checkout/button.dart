import 'package:flutter/material.dart';

class ButtonCheckOut extends StatelessWidget {
  final String text;
  final  Function()? onPressed;
  const ButtonCheckOut({super.key, required this.text , required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: 
            onPressed,
          child:  Text(text),
        ),
      ),
    );
  }
}
