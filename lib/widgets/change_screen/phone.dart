import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/controller/auth/profile_controller.dart';
import '../../controller/auth/editphone_controller.dart';
import '../../core/functions/validation.dart';
import '../custom_text_form_field.dart';

class ChangePhone extends GetView<ProfileControllerImp> {
  const ChangePhone({super.key});

  @override
  Widget build(BuildContext context) {
    EditPhoneController controller = Get.put(EditPhoneController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("تغيير رقم الجوال"),
      ),
      body: Form(
        key: controller.formstate,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              myController: controller.phone,
              hint: 'رقم الهاتف',
              text:
                  '${controller.myServices.sharedPreferences.getString('userphone')}',
              onSave: (value) {
                controller.phone = value;
              },
              validator: (value) {
                return validInput(value!, 9, 9, "phone");
              },
            ),
            ElevatedButton(
              onPressed: () async {
                await controller.editPhone();
              },
              child: const Text("حفظ"),
            ),
          ],
        ),
      ),
    );
  }
}
