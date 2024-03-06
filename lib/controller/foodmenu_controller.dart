import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/core/class/statusrequiest.dart';
import 'package:http/http.dart' as http;
import 'package:semo/core/constant/routes.dart';
import 'package:semo/core/constant/zero.dart';
import 'package:semo/data/model/foodrestaurants_model.dart';
import 'package:semo/linkapi.dart';
import '../../core/functions/handlingdata_controller.dart';
import '../core/services/services.dart';
import 'count_controller.dart';

//صفحة عرض المطاعم بعد اختيار الكاتيقوري

class FoodMenuController extends GetxController {
  List foodMenu = []; //متغير لتخزين البيانات بعد جلبها من ال backend .
  List categories = [];
  List categoriesmenua = [];
  List categoriess= [];
  List categoriesmenu = [];
  int convertedValue=0;
  String? categoriesName;
  List<String> foodMenuTypes = [];
  List mealType=[];
   int countitems=0;
  late FoodRestaurantsModel foodRestaurantsModel;
// FoodRestaurantsModel foodRestaurantsModel = FoodRestaurantsModel();
 CountController cartController = Get.put(CountController());
  late StatusRequiest statusRequiest;
  String? catid;
  int? selectedCat  ;
  MyServices myServices = Get.find();
  // int? selectedCat;

  @override
  void onInit()async {
       onBackInit();

    statusRequiest = StatusRequiest.loading;
    catid = Get.arguments['catid'];
    // foodRestaurantsModel = FoodRestaurantsModel();
    categories = Get.arguments['categories'];
    categoriess = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    categoriesName = Get.arguments['categoriesname'];
    foodRestaurantsModel = Get.arguments['foodRestaurantsModel'];
    // print('-========================');
    // print('cat id = ${catid} '); //categories_id
    // print('categories = ${categories}'); //list data
    // print('selected cat = ${selectedCat}'); //null
    // print('categoriesName = ${categoriesName}');//categories_name
    // print(' hhhhhhhhhhhere = ${foodRestaurantsModel.restaurantsName}');
     
    menu();
    meal(categories);
    meall(categories);
    // countitems;
    super.onInit();
  }

   

  Future menu() async {
    statusRequiest = StatusRequiest.loading;
    try {
      var response = await http.post(Uri.parse(AppLink.menu), body: {
        // 'restaurants_id': catid.toString()
        'restaurants_id': foodRestaurantsModel.restaurantsId
      }); //getData from "Data folder" not "controller folder"
      
      statusRequiest = handlingData(response);
      // if(StatusRequiest.success== statusRequiest){
      if (response.statusCode == 200) {
        final jsondata = jsonDecode(response.body);
        foodMenu.addAll(jsondata['data']);
        mealType.addAll(jsondata['data']);
        statusRequiest = StatusRequiest.success;
      } else {
        statusRequiest = StatusRequiest.faliure;
      }
    } catch (e) {
      statusRequiest = StatusRequiest.serverException;
    }
    update();
  }


  meal(foodkind) async {
    categoriesmenu.clear();
  statusRequiest = StatusRequiest.loading;
  try {
    var response = await http.post(Uri.parse(AppLink.menucatlist), body: {
      'restaurants_name': foodRestaurantsModel.restaurantsName,
      'food_kind': foodkind ,// Pass the mealType parameter to the API
      'userid':myServices.sharedPreferences.getString('id'),
    });

    statusRequiest = handlingData(response);

    if (response.statusCode == 200) {
      final jsondata = jsonDecode(response.body);
      categoriesmenu.addAll(jsondata['data']);
      statusRequiest = StatusRequiest.success;
    } else {
      statusRequiest = StatusRequiest.faliure;
    }
  } catch (e) {
    statusRequiest = StatusRequiest.serverException;
  }
  update();
}
Future<void> meall(foodkind) async {
  update();
    categoriesmenu.clear();
  statusRequiest = StatusRequiest.loading;
  try {
    var response = await http.post(Uri.parse(AppLink.menucatlistcount), body: {
      'restaurants_name': foodRestaurantsModel.restaurantsName,
      'food_kind': foodkind ,// Pass the mealType parameter to the API
      'userid':myServices.sharedPreferences.getString('id'),
    });

    statusRequiest = handlingData(response);

    if (response.statusCode == 200) {
      final jsondata = jsonDecode(response.body);
      categoriesmenua.addAll(jsondata['data']);
      statusRequiest = StatusRequiest.success;
    } else {
      statusRequiest = StatusRequiest.faliure;
    }
  } catch (e) {
    statusRequiest = StatusRequiest.serverException;
  }
  update();
}

// Future<void> fetchFoodMenuTypes() async {
//     try {
//       final response = await http.get(Uri.parse('your_api_endpoint_here'));
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         foodMenuTypes = List<String>.from(data['foodMenuTypes']);
//       } else {
//         // Handle error case
//       }
//     } catch (e) {
//       // Handle exception
//     }
//     update();
//   }

//  Future getCountItems(String foodid) async {
//     statusRequiest = StatusRequiest.loading;
//     try {
//       final response = await http.post(Uri.parse(AppLink.cartgetcountitems),
//           body: {
//             'foodid': '3',
//             'usersid': myServices.sharedPreferences.getString('id')!
//           });
//     print('object');
//           print(foodRestaurantsModel.foodId);
//       if (response.statusCode == 200) {
//         int countitems = 0;
//         final jsondata = jsonDecode(response.body);
//         countitems = int.parse(jsondata['data']);
//         print('countitems = ${countitems}');
//         // countitems=jsondata['data'];
//         statusRequiest = StatusRequiest.success;
//         return countitems;
//       } else {
//         statusRequiest = StatusRequiest.faliure;
//       }
//     } catch (e) {
//       statusRequiest = StatusRequiest.serverException;
//     }
//     update();
//   }



  Future additems(String foodid) async {
    // update();
    // statusRequiest = StatusRequiest.loading;
    try {
      final response = await http.post(Uri.parse(AppLink.cartadd), body: {
        "usersid": myServices.sharedPreferences.getString("id")!,
        "foodid": foodid,
      });
      if (response.statusCode == 200) {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تمت اضافة وجبة الى السلة"));
            statusRequiest = StatusRequiest.success;
      } else {
        statusRequiest = StatusRequiest.faliure;
      }
    } catch (e) {
      statusRequiest = StatusRequiest.serverException;
    }
    // update();
  }

  Future deleteitems(String foodid) async {
    // update();
    // statusRequiest = StatusRequiest.loading;
    try {
      final response = await http.post(Uri.parse(AppLink.cartdelete), body: {
        'foodid': foodid,
        'usersid': myServices.sharedPreferences.getString('id')!
      });

      // statusRequiest = handlingData(response);
      if (response.statusCode == 200) {
        Get.rawSnackbar(
            title: "اشعار", messageText: const Text("تم ازالة وجبة"));
        statusRequiest = StatusRequiest.success;
      } else {
        statusRequiest = StatusRequiest.faliure;
      }

      // update();
    } catch (e) {
      statusRequiest = StatusRequiest.serverException;
    }
  }

  goToCheckOut() {
    Get.toNamed(AppRoutes.cart,);
  }

  add() {
    additems(
      foodRestaurantsModel.foodId!,
    );
    countitems++;
    update();
  }

  onRemove() {
    if (countitems > 0) {
      deleteitems(foodRestaurantsModel.foodId!);
      countitems--;
    }
      update();
  }

  onBack()async{
    // statusRequiest = StatusRequiest.loading;
    update();
    try {
      final response = await http.post(Uri.parse(AppLink.deleteCount), body: {
        'usersid': myServices.sharedPreferences.getString('id')!
      });
      // statusRequiest = handlingData(response);
      if (response.statusCode == 200) {
        // Get.rawSnackbar(
        //     title: "اشعار", messageText: const Text("تم ازالة وجبة"));
        statusRequiest = StatusRequiest.success;
        Get.back();
      } else {
        statusRequiest = StatusRequiest.faliure;
      }
      update();
    } catch (e) {
      statusRequiest = StatusRequiest.serverException;
    }
  }

  

  changeCat(val,catval)async{
    // Get.snackbar("title", "message");
    // statusRequiest=StatusRequiest.loading;
    // print('agaaaaaain : ${foodRestaurantsModel.restaurantsName}');848
    //  await getCountItems('3');
    // getCountItems('3');
    // print(getCountItems('${foodRestaurantsModel.foodId}'));
    selectedCat = val;
    catid = catval;
    // print(selectedCat);
   meal(catid);
   
    update();
  }
}
