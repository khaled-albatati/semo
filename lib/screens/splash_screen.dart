import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/core/constant/routes.dart';
import '../core/functions/version.dart';
import '../utils/helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  String appVersion = "Loading...";

  @override
  void initState() {
    super.initState();
    
    _loadAppVersion();

    _timer = Timer(const Duration(milliseconds: 6000), () {
      Get.offAllNamed(AppRoutes.navbar);
    });
  }

  Future<void> _loadAppVersion() async {
    String version = await Info().getAppVersion();
    setState(() {
      appVersion = version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('الإصدار: $appVersion'),
      ),
      body: SizedBox(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                Helper.getAssetName("splashIcon.png", "virtual"),
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'assets/images/semo.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}