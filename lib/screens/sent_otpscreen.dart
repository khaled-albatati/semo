import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../const/colors.dart';
import '../core/constant/routes.dart';
import '../utils/helper.dart';

class SendOTPScreen extends StatelessWidget {
  // static const routeName = "/sendOTP";

  const SendOTPScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'تم ارسال رمز التحقق الى بريدك الالكتروني',
              style: Helper.getTheme(context).titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "الرجاء التحقق من بريدك الالكتروني ",
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OTPInput(),
                OTPInput(),
                OTPInput(),
                OTPInput(),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.newPwScreen);
                },
                child: const Text("التالي"),
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("لم تستلم ؟"),
                Text(
                  "اضفط هنا",
                  style: TextStyle(
                    color: AppColor.orange,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}

class OTPInput extends StatelessWidget {
  const OTPInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: ShapeDecoration(
        color: AppColor.placeholderBg,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "*",
                style: TextStyle(fontSize: 45),
              ),
            ],
          ),
          TextField(
            decoration: InputDecoration(border: InputBorder.none),
          ),
        ],
      ),
    );
  }
}
