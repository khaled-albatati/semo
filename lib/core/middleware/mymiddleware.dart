import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/core/constant/routes.dart';
import 'package:semo/core/services/services.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();
  @override
  // ignore: body_might_complete_normally_nullable
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("onBoarding") == "1") {
      return const RouteSettings(name: AppRoutes.splashScreenone);
    }
  }
}
