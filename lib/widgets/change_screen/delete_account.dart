import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/controller/auth/delete_controller.dart';

import '../../utils/helper.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    DeleteControllerImp controller = Get.put(DeleteControllerImp());

    return Scaffold(
      body: SizedBox(
        height: Helper.getScreenHeight(context),
        width: Helper.getScreenWidth(context),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 30,
            ),
            child: Column(
              children: [
                Text(
                  "حذف الحساب",
                  style: Helper.getTheme(context).titleLarge,
                ),
                const Spacer(),
                // const Text('Add your details to login'),
                // const Spacer(),
                TextField(
                    controller: controller.username,
                    decoration: const InputDecoration(
                      hintText: 'اسم المستخدم',
                    )),
                const Spacer(),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'كلمة المرور',
                  ),
                  controller: controller.password,
                ),
                const Spacer(),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.deleteAccount();
                    },
                    child: const Text("حذف الحساب"),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
