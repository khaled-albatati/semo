// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:get/get.dart';
// import 'package:semo/core/constant/routes.dart';
// import 'package:semo/core/services/services.dart';
// import 'package:semo/data/datasource/remote/categories_data.dart';
// import '../core/class/statusrequiest.dart';
// import '../linkapi.dart';

// abstract class CategoriesController extends GetxController {
//   initialData();
//   getdata();
//   goToItems(List categories, int selectedCat, String categoryid);
// }

// class CategoriesControllerImp extends CategoriesController {
//   MyServices myServices = Get.find();
//   String? username;
//   String? id;
//   CategoriesData categoriesData = CategoriesData(Get.find());
//   List categories = []; //متغير لتخزين البيانات بعد جلبها من ال backend .
//   late StatusRequiest statusRequiest;

//   @override
//   initialData() {
//     // getFav();
//     // getdata();
//     username = myServices.sharedPreferences.getString("username");
//     id = myServices.sharedPreferences.getString("id");
//   }

//   @override
//   void onInit() {
//     getdata();
//     initialData();
//     super.onInit();
//   }

//   @override
//   Future getdata() async {
//     statusRequiest = StatusRequiest.loading;
//     try {
//       final response = await http.post(Uri.parse(AppLink.homePage));
//       if (response.statusCode == 200) {
//         final jsondata = jsonDecode(response.body);
//         categories.addAll(jsondata['categories']);
//         statusRequiest = StatusRequiest.success;
//       } else {
//         statusRequiest = StatusRequiest.faliure;
//       }
//     } catch (e) {
//       statusRequiest = StatusRequiest.serverException;
//     }
//     update();
//   }

//   @override
//   goToItems(categories, selectedCat, categoryid) {
//     Get.toNamed(AppRoutes.items, arguments: {
//       "categories": categories,
//       "selectedcat": selectedCat,
//       "catid": categoryid, //the space have big baaaaad effect
//     });
//   }
// }
