import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const OrangeButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
