import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/core/constant/routes.dart';
import '../../core/class/statusrequiest.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/auth/login.dart';
import '../../linkapi.dart';
import 'package:http/http.dart' as http;

abstract class LoginController extends GetxController {
  MyServices myServices = Get.find();

  // late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController username;
  LoginData loginData = LoginData(Get.find());
  late StatusRequiest statusRequiest;
  bool isShowPassword = true;
  GlobalKey<FormState> formstateLogin = GlobalKey<FormState>();

  toSignUp();
  toForgetPassword();
  login();
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }
}

class LoginControllerImp extends LoginController {
  //============AI =====================\\
  @override
  Future login() async {
    statusRequiest = StatusRequiest.loading;
    var formdata = formstateLogin.currentState;
    if (formdata!.validate()) {
      try {
        var response = await http.post(Uri.parse(AppLink.login), body: {
          'username': username.text,
          'password': password.text,
        });
        if (response.statusCode == 200) {
          Map<String, dynamic> responseBody = json.decode(response.body);
          String status = responseBody['status'];
          if (status == 'success') {
            myServices.sharedPreferences
                .setInt('id', responseBody['data']['user_id']);
            // String userid = myServices.sharedPreferences.getString("id")!;
            myServices.sharedPreferences
                .setString("username", responseBody['data']['user_name']);
                print('object');
            myServices.sharedPreferences
                .setString("email", responseBody['data']['user_email']);
            myServices.sharedPreferences
                .setString("userphone", responseBody['data']['user_phone']);
            myServices.sharedPreferences
                .setInt("user_wallet", responseBody['data']['user_wallet']);

            // FirebaseMessaging.instance.subscribeToTopic("users");
            // FirebaseMessaging.instance.subscribeToTopic("users$userid");
            Get.offAllNamed(AppRoutes.navbar);
          } else if (status == 'failure') {
            // Display error dialog for invalid credentials
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
                    Text('هناك خطأ في اسم المستخدم\n أو كلمة المرور'),
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
        } else {
          Get.defaultDialog(
            title: "X",
            titleStyle: const TextStyle(color: Colors.red),
            middleText: "هناك خطأ",
          );

          statusRequiest = StatusRequiest.faliure;
        }
      } catch (e) {
        statusRequiest = StatusRequiest.serverException;
      }
      update();
    }
  }

  @override
  toSignUp() {
    Get.offAllNamed(AppRoutes.signUp);
  }

  @override
  toForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  void onInit() {
    // phone = TextEditingController();
    username = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    // phone.dispose();
    username.dispose();
    password.dispose();
    super.dispose();
  }

  void showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.close, color: Colors.red),
              SizedBox(width: 8),
              Text(
                'هناك خطأ في اسم المستخدم أو كلمة المرور',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('موافق'),
            ),
          ],
        );
      },
    );
  }
}
