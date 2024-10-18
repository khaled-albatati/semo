import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/auth/login_field.dart';
import '../../widgets/auth/logo_log.dart';
import '/core/constant/color.dart';
import '/core/constant/imageassets.dart';
import '/controller/auth/forgetpassword/forgetpassword_controller.dart';
import '/core/functions/validation.dart';
import '/widgets/auth/custom_buttonauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    // ForgetPasswordControllerImp controller =
    //     Get.put(ForgetPasswordControllerImp());
    Get.lazyPut((() => ForgetPasswordControllerImp()));

    return Scaffold(
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) => Container(
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
            key: controller.formstate,
            child: ListView(
              children: [
                const SizedBox(height: 20),
                const LogoLog(logo: AppImageAssets.forgetpass),
                Container(margin: const EdgeInsets.symmetric(horizontal: 15)),
                const SizedBox(height: 90),
                LoginField(
                  obscureText: false,
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, 1, 24, "email");
                  },
                  myController: controller.email,
                  lableText: "40".tr, //'Email'
                  hintText: "Email@gmail.com", //'Email'
                  iconData: Icons.email_outlined,
                ),
                const SizedBox(height: 15),
                CustomButtonAuth(
                  color: AppColor.cyan,
                  onPressed: () {
                    controller.checkEmail();
                    // controller.toVerfiyCode();
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
