import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/controller/auth/profile_controller.dart';
import '../../controller/auth/editphone_controller.dart';
import '../../core/functions/validation.dart';
import '../custom_text_form_field.dart';

class ChangeWhats extends GetView<ProfileControllerImp> {
  const ChangeWhats({super.key});

  @override
  Widget build(BuildContext context) {
    EditPhoneController controller = Get.put(EditPhoneController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("تغيير رقم الواتس"),
      ),
      body: Form(
        key: controller.formstate,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              myController: controller.whats,
              hint: 'رقم الواتس',
              text:
                  '${controller.myServices.sharedPreferences.getString('userwhats')}',
              onSave: (value) {
                controller.whats = value;
              },
              validator: (value) {
                return validInput(value!, 9, 9, "phone");
              },
            ),
            ElevatedButton(
              onPressed: () async {
                await controller.editWhats();
              },
              child: const Text("حفظ"),
            ),
          ],
        ),
      ),
    );
  }
}
