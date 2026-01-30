import 'package:get/get.dart';
import 'package:semo/core/constant/routes.dart';
import 'package:semo/core/constant/zero.dart';

class Redirector {
  static void redirectUser() {
    final userId = myServices.sharedPreferences.getInt("id");
    final userAprove = myServices.sharedPreferences.getInt("userAprove");

    if (userId == null || userAprove != 0) {
      Get.offAllNamed(AppRoutes.login);
      Get.snackbar("هنالك مشكلة في الحساب", "الرجاء التواصل مع الادارة");
    }
  }
}
