import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/screens/login_screen.dart';
import '../../../../core/constant/imageassets.dart';
import '../../../widgets/auth/logo_log.dart';
import '../../widgets/auth/header_log.dart';

class SuccessResetPassword extends StatefulWidget {
  const SuccessResetPassword({super.key});

  @override
  State<SuccessResetPassword> createState() => _SuccessResetPasswordState();
}

class _SuccessResetPasswordState extends State<SuccessResetPassword> {
  // ignore: unused_field
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer(const Duration(milliseconds: 4000), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/bgLight.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            
            const LogoLog(
              logo: AppImageAssets.success,
            ),

            HeaderLog(text:"85".tr),
          ],
        ),
      ),
    );
  }
}

