import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:semo/controller/auth/signup_controller.dart';
import 'package:semo/core/functions/validation.dart';
import '../const/colors.dart';
import '../utils/helper.dart';

class SignUpScreen extends GetView<SignUpControllerImp> {
  SignUpScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: const Text("حساب جديد"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: Helper.getScreenWidth(context),
            height: Helper.getScreenHeight(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Form(
                key: controller.formstate,
                child: Column(
                  children: [
                    const Icon(Icons.group_add_outlined,
                        size: 200, color: Colors.orange),
                    const Spacer(),
                    TextFormField(
                        controller: controller.username,
                        decoration: const InputDecoration(hintText: 'الاسم'),
                        validator: (val) {
                          return validInput(val!, 3, 25, "username");
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: controller.password,
                      decoration:
                          const InputDecoration(hintText: 'كلمة المرور'),
                      validator: (val) {
                        return validInput(val!, 8, 25, "password");
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'رقم الهاتف'),
                      controller: controller.phone,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      validator: (val) {
                        return validInput(
                          val!,
                          9,
                          9,
                          "phone",
                        );
                      },
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.signUp();
                        },
                        child: const Text("تسجيل"),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        controller.toLogin();
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text("لديك حساب بالفعل ؟"),
                          Text(
                            "تسجيل دخول",
                            style: TextStyle(
                              color: AppColor.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
