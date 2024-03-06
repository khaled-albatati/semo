import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/core/class/statusrequiest.dart';
import 'package:semo/core/services/services.dart';
import 'package:http/http.dart' as http;
import '../../core/constant/routes.dart';
import '../../linkapi.dart';

class EditUserNameController extends GetxController {
  MyServices myServices = Get.find();
  late TextEditingController username;
  late StatusRequiest statusRequiest;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  void onInit() {
    username = TextEditingController();
    editUserName();
    super.onInit();
  }

 Future editUserName() async {
        statusRequiest = StatusRequiest.loading;

    var formdata = formstate.currentState;
    if (formdata!.validate()) {
        var response = await http.post(Uri.parse(AppLink.editUserName), body: {
          'id': myServices.sharedPreferences.getString("id"),
          'user_name': username.text,
     } );

        if (response.statusCode == 200) {
          Map<String, dynamic> responseBody = json.decode(response.body);
          String status = responseBody['status'];
          if (status == 'success') {
            myServices.sharedPreferences
                .setString("username", 'user_name');
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
                    Text('اسم المستخدم مستعمل'),
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
       
      
      update();
    
        }}}
}
