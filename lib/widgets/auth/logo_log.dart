import 'package:flutter/material.dart';

class LogoLog extends StatelessWidget {
  final String logo;
  const LogoLog({super.key, required this.logo});

  @override
  Widget build(BuildContext context) {
    return Image.asset(logo, height: 250,width: 250,);
  }
}