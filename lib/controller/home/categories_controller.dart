// import 'dart:convert';
import 'package:get/get.dart';
import 'package:semo/controller/home/food_controller.dart';
import 'package:semo/core/class/statusrequiest.dart';
// import 'package:http/http.dart' as http;
import 'package:semo/data/datasource/remote/home_data.dart';
import 'package:semo/data/model/categoriesmodel.dart';
// import 'package:semo/linkapi.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata_controller.dart';
import '../../core/services/services.dart';
// import 'package:new_version/new_version.dart';

//kinds of food

class CategoriesHomeController extends GetxController {
  List categories = []; //متغير لتخزين البيانات بعد جلبها من ال backend .
  // List restaurant = [] ;  //متغير لتخزين البيانات بعد جلبها من ال backend .
  MyServices myServices = Get.find();
  HomeData homedata =HomeData(Get.find());
  CategoriesModel? categoriesModel;
  FoodHomeController? foodHomeController;
  late StatusRequiest statusRequiest;
  // final newVersion = NewVersion(
  //   androidId: '',
  //   iOSId: '',
  // );
  // getVersion()async{
  //   newVersion.showAlertIfNecessary(context: Get.context!);
  //   final status = await newVersion.getVersionStatus();
  //   if (status != null) {
  //     newVersion.showUpdateDialog(
  //         context: Get.context!,
  //         versionStatus: status,
  //         dialogTitle: "تحديث جديد",
  //         dialogText: "هنالك تحديث جديد",
  //         allowDismissal: false,
  //         updateButtonText: "تحديث",
  //         dismissAction: () {},
  //         dismissButtonText: "خروج");
  //   }
  // }

  @override
  void onInit() async {
    await getCategories();
    // await getVersion();
    // userData();
    super.onInit();
  }

  // Future getCategories() async {
  //   statusRequiest = StatusRequiest.loading;
  //   try {
  //     var response = await http.post(Uri.parse(AppLink
  //         .categoriesHome)); //getData from "Data folder" not "controller folder"
  //     statusRequiest = handlingData(response);

  //     // if(StatusRequiest.success== statusRequiest){
  //     if (response.statusCode == 200) {
  //       final jsondata = jsonDecode(response.body);
  //       categories.addAll(jsondata['data']);
  //       statusRequiest = StatusRequiest.success;
  //     } else {
  //       statusRequiest = StatusRequiest.faliure;
  //     }
  //   } catch (e) {
  //     statusRequiest = StatusRequiest.serverException;
  //   }
  //   update();
  // }

  goToCategories(categories, categoryid) {
    Get.toNamed(AppRoutes.restaurantCategories, arguments: {
      "categories": categories,
      "catid": categoryid, //the space have big baaaaad effect
    });
  }


    Future getCategories() async {
    statusRequiest = StatusRequiest.loading;
      var response = await homedata.getCategories(); //getData from "Data folder" not "controller folder"
      statusRequiest = handlingData(response);

      if (StatusRequiest.success == statusRequiest) {
        categories.addAll(response['data']);
    
  }
    update();
    }
}
