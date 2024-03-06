import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/core/constant/routes.dart';

abstract class ForgetPasswordController extends GetxController {
  late TextEditingController email;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  // GlobalKey<FormState> formstate1=GlobalKey<FormState>();

  // late TextEditingController phone;

  checkEmail();
  toVerfiyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  @override
  checkEmail() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      Get.offNamed(AppRoutes.verfiyCode);
    }
  }

  @override
  toVerfiyCode() {
    // Get.offNamed(AppRoutes.verfiyCode);
  }

  @override
  void onInit() {
    email = TextEditingController();
    // phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    // phone.dispose();
    super.dispose();
  }
}
