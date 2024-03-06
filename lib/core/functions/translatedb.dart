import 'package:get/get.dart';
import 'package:semo/core/services/services.dart';

translateDB(columnar, columnen) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("language") == "ar") {
    return columnar;
  } else {
    return columnen;
  }
}
