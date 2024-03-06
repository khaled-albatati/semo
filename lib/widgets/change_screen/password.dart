import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/controller/auth/editpassword_controller.dart';
import 'package:semo/controller/auth/profile_controller.dart';
import 'package:semo/core/functions/validation.dart';
import '../custom_text_form_field.dart';

class ChangePassword extends GetView<ProfileControllerImp> {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    EditPasswordControllerImp controller = Get.put(EditPasswordControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: const Text("تغيير كلمة المرور "),
      ),
      body: Form(
        key: controller.formstate,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              myController: controller.password,
              hint: "كلمة المرور",
              text:
                  '**********',
              onSave: (value) {
                controller.password = value;
              },
              validator: (value) {
              return validInput(value!, 8, 25, "password");
              },
            ),
            ElevatedButton(
              onPressed: () async {
                await controller.editUserPassword();
              },
              child: const Text("حفظ"),
            ),
          ],
        ),
      ),
    );
  }
}
