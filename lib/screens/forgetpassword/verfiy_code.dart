import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/forgetpassword/verfiycode_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../widgets/auth/header_log.dart';

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerfiyCodeControllerImp controller = Get.put(VerfiyCodeControllerImp());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text("87".tr),
        foregroundColor: AppColor.cyan,
      ),
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
            HeaderLog(text: '98'.tr),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: OtpTextField(
                fieldWidth: 60,
                borderRadius: BorderRadius.circular(50),
                mainAxisAlignment: MainAxisAlignment.center,
                margin: const EdgeInsets.only(top: 250, right: 5),
                // enabledBorderColor: AppColor.cyan,
                numberOfFields: 6,
                borderColor: AppColor.cyan,
                focusedBorderColor: Colors.cyan,
                // styles: otpTextStyles,
                showFieldAsBox: false,
                borderWidth: 4.0,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here if necessary
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("81".tr),
                          content: Text('${"169".tr} $verificationCode'),
                        );
                      });
                  controller.toResetPassword();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
