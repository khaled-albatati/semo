import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/core/constant/routes.dart';

abstract class ResetPasswordController extends GetxController {
  late TextEditingController password;
  late TextEditingController rePassword;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
   bool isShowPassword =true;
  // GlobalKey<FormState> formstate1=GlobalKey<FormState>();

  // late TextEditingController phone;

  resetPassword();
  toSuccess();
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }
}

class ResetPasswordControllerImp extends ResetPasswordController {
  @override
  resetPassword() {
    var formdata = formstate.currentState;
    // var formdata1=formstate1.currentState;
    if (formdata!.validate()) {
      // if(password.text==rePassword.text && password.text.isNotEmpty==rePassword.text.isNotEmpty){
      Get.offAllNamed(AppRoutes.login);
    }
  }

  @override
  toSuccess() {
    Get.offNamed(AppRoutes.successResetPassword);
  }

  toLogin() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    // phone.dispose();
    super.dispose();
  }
}
