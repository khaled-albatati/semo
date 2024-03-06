// import 'dart:js';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../const/colors.dart';
import '../controller/auth/login_controller.dart';
import '../core/constant/routes.dart';
import '../core/functions/validation.dart';
import '../utils/helper.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // static const routeName = "/loginScreen";
  // final phoneController = TextEditingController();

  // final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: const Text("تسجيل دخول"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: Helper.getScreenHeight(context),
          width: Helper.getScreenWidth(context),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 30,
            ),
            child: Form(
              key: controller.formstateLogin,
              child: Column(
                children: [
                  // Text(
                  //   "تسجيل دخول",
                  //   style: Helper.getTheme(context).titleLarge,
                  // ),
                  // const Spacer(),
                  const Icon(
                    Icons.login,
                    color: AppColor.orange,
                    size: 200,
                  ),
                  const SizedBox(height: 30,),
                  // const Text('Add your details to login'),
                  // const Spacer(),
                  TextFormField(
                    controller: controller.username,
                    decoration: const InputDecoration(hintText: 'اسم المستخدم'),
                    validator: (val) {
                      return validInput(val!, 3, 25, "username");
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: controller.password,
                    obscureText: true,
                    decoration: const InputDecoration(hintText: 'كلمة المرور'),
                    validator: (val) {
                      return validInput(val!, 8, 25, "password");
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // const Spacer(),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.login();
                      },
                      child: const Text("تسجيل دخول"),
                    ),
                  ),
                  // const Spacer(),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.forgetPassword);
                    },
                    child: const Text("نسيت كلمة المرور ؟"),
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.toSignUp();
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("ليس لديك حساب؟"),
                        Text(
                          "حساب جديد",
                          style: TextStyle(
                            color: AppColor.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
