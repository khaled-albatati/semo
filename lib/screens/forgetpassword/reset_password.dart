import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/forgetpassword/resetpassword_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/imageassets.dart';
import '../../../../core/functions/validation.dart';
import '../../../widgets/auth/custom_buttonauth.dart';
import '../../../widgets/auth/login_field.dart';
import '../../../widgets/auth/logo_log.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    // Get.lazyPut((() => ResetPasswordControllerImp()));

    return Scaffold(
        // body: GetBuilder<ResetPasswordControllerImp>(
      // builder: (controller) => Container(
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
        child: Form(
          child: Form(
            key: controller.formstate,
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const LogoLog(
                  logo: AppImageAssets.verfiyCode,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                ),
                const SizedBox(
                  height: 90,
                ),
                LoginField(
                  obscureText: true,
                  isNumber: false,
                  valid: (val) {
                    //  RegExp regex = RegExp(r'^.{5,}$');
                    if (controller.password.text !=
                        controller.rePassword.text) {
                      return "94".tr;
                    } else {
                      return validInput(val!, 8, 24, "password");
                    }
                  },
                  myController: controller.password,
                  lableText: "84".tr, //'new password'
                  hintText: "***************", //'new password'
                  iconData: Icons.lock_outlined,
                ),
                const SizedBox(
                  height: 20,
                ),
                LoginField(
                  obscureText: true,
                  isNumber: false,
                  valid: (val) {
                    //  RegExp regex = RegExp(r'^.{5,}$');
                    if (controller.password.text !=
                        controller.rePassword.text) {
                      return "94".tr;
                    } else {
                      return validInput(val!, 8, 24, "password");
                    }
                  },
                  // patternRole:r'(?=.*?[#?!@$%^&*-])',
                  myController: controller.rePassword,

                  lableText: "83".tr, //'re password'
                  hintText: "***************", //'re password'
                  iconData: Icons.lock_outlined,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButtonAuth(
                  color: AppColor.cyan,
                  onPressed: () {
                    controller.resetPassword();
                    // controller.toSuccess();
                  },
                  text: ('76'.tr), //submit
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
