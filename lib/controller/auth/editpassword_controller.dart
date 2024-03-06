import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/core/constant/routes.dart';
import '../../core/class/statusrequiest.dart';
import '../../core/services/services.dart';
import '../../linkapi.dart';
import 'package:http/http.dart' as http;

abstract class EditPasswordController extends GetxController {
  MyServices myServices = Get.find();
  late TextEditingController password;
  late StatusRequiest statusRequiest;
  bool isShowPassword = true;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  editUserPassword();
}

class EditPasswordControllerImp extends EditPasswordController {
  //============AI =====================\\
  @override
  void onInit() {
    password=TextEditingController();
    super.onInit();
  }

  @override
 Future editUserPassword() async {
    statusRequiest = StatusRequiest.loading;
   
      var response = await http.post(Uri.parse(AppLink.editPassword), body: {
        'id': myServices.sharedPreferences.getString("id"),
        'password': password.text,
      });
       if (response.statusCode == 200) {
          Map<String, dynamic> responseBody = json.decode(response.body);
          String status = responseBody['status'];
          if (status == 'success') {
          
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
                    Text('هناك خطأ'),
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
      update();
      } 
    }
  
