import 'package:flutter/cupertino.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:semo/core/functions/fcmconfig.dart';
import 'package:semo/core/services/services.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();
  changeLanguage(String languageCode) {
    Locale locale = Locale(languageCode);
    myServices.sharedPreferences.setString("language", languageCode);
    Get.updateLocale(locale);
  }

  // requestPerLocation() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return Get.snackbar("تنبيه", "الرجاء تشغيل خدمة تحديد الموقع");
  //   }
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Get.snackbar("تنبيه", "الرجاء اعطاء صلاحية الموقع للتطبيق");
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     // Permissions are denied forever, handle appropriately.
  //     return Get.snackbar("تنبيه", "لا يمكن استعمال التطبيق من دون اللوكيشين");
  //   }
  // }

  @override
  void onInit() {
    // requestPerLocation();
    requestPermissionNotification();
    // FirebaseMessaging.onBackgroundMessage(backgroundHandler);
    // fcmconfig();
    String? sharedPreferences =
        myServices.sharedPreferences.getString("language");
    if (sharedPreferences == "ar") {
      language = const Locale("ar");
    } else if (sharedPreferences == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }

    super.onInit();
  }
}
