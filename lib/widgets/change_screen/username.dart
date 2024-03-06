import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/controller/auth/profile_controller.dart';
import 'package:semo/core/functions/validation.dart';
import '../../controller/auth/editusername_controller.dart';
import '../custom_text_form_field.dart';

class ChangeUserName extends GetView<ProfileControllerImp> {
  const ChangeUserName({super.key});

  @override
  Widget build(BuildContext context) {
    EditUserNameController controller = Get.put(EditUserNameController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("تغيير اسم المستخدم"),
      ),
      body: Form(
        key: controller.formstate,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              myController: controller.username,
              hint: 'اسم المستخدم',
              text:
                  '${controller.myServices.sharedPreferences.getString('username')}',
              onSave: (value) {
                controller.username = value;
              },
              validator: (value) {
             return validInput(value!, 3, 25, "username");
              },
            ),
            ElevatedButton(
              onPressed: () async {
                await controller.editUserName();
              },
              child: const Text("حفظ"),
            ),
          ],
        ),
      ),
    );
  }
}
