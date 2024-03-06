import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/core/constant/routes.dart';
import 'package:semo/data/datasource/remote/auth/signup.dart';
import 'package:http/http.dart' as http;
import '../../core/class/statusrequiest.dart';
import '../../linkapi.dart';

abstract class SignUpController extends GetxController {
  bool isShowPassword = true;

  signUp();
  toLogin();
  toForgetPassword();
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController username;
  // late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  List data = []; //متغير لتخزين البيانات بعد جلبها من ال backend .
  SignUpData signUpData = SignUpData(Get.find());
  late StatusRequiest statusRequiest;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  //===========AI ===================

  @override
  signUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      var response = await http.post(Uri.parse(AppLink.signUp), body: {
        'username': username.text,
        'password': password.text,
        // 'email': email.text,
        'phone': phone.text,
      });
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(response.body);
        String status = responseBody['status'];
        if (status == 'success') {
          // data.addAll(response['data']);
          Get.offAllNamed(AppRoutes.navbar);
        } else {
           Get.dialog(
              AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(50.0), // Set the border radius here
                ),
                title: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cancel, color: Colors.red, size: 50),
                  ],
                ),
                content: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('اسم المستخدم او رقم الهاتف مستخدم بالفعل'),
                  ],
                ),
                actions: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('موافق'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          statusRequiest = StatusRequiest.faliure;
          update();
        }
      }
    }
  }

  @override
  toLogin() {
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  toForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  void onInit() {
    username = TextEditingController();
    // email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    // email.dispose();
    password.dispose();
    phone.dispose();
    super.dispose();
  }
}
