// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/core/constant/routes.dart';

abstract class VerfiyCodeController extends GetxController {
  late String verfiyCode;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  checkCode();
  toResetPassword();
  toSuccessSignUp();
}

class VerfiyCodeControllerImp extends VerfiyCodeController {
  @override
  checkCode() {
  }

  @override
  toResetPassword() {
    // var formdata = formstate.currentState;
    // if (formdata!.validate()) {
      Get.offAllNamed(AppRoutes.resetPassword);
    // }
  }
  
  @override
  toSuccessSignUp() {
    Get.offNamed(AppRoutes.successSignUp);
  }


  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
