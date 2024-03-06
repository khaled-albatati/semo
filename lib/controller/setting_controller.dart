  import 'package:get/get.dart';
import 'package:semo/core/constant/routes.dart';
import 'package:semo/core/services/services.dart';

class SettingController extends GetxController{
  MyServices myServices = Get.find();

  logout(){
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.navbar);
  }
}