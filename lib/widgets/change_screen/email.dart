import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth/editemail_controller.dart';
import '../../core/functions/validation.dart';
import '../custom_text_form_field.dart';

class ChangeEmail extends StatelessWidget {
  const ChangeEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EditEmailController controller = Get.put(EditEmailController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("تغيير البريد الإلكتروني"),
      ),
      body: Form(
        key: controller.formstate,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              myController: controller.email,
              hint: 'البريد الالكتروني',
              text:
                  '${controller.myServices.sharedPreferences.getString('email')}',
              onSave: (value) {
                controller.email = value;
              },
              validator: (value) {
                return validInput(value!, 7, 180, "email");
              },
            ),
            ElevatedButton(
              onPressed: () async {
                await controller.editEmail();
              },
              child: const Text("حفظ"),
            ),
          ],
        ),
      ),
    );
  }
}
