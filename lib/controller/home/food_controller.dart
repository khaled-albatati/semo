// import 'dart:convert';
import 'package:get/get.dart';
import 'package:semo/core/class/statusrequiest.dart';
// import 'package:http/http.dart' as http;
import 'package:semo/data/datasource/remote/home_data.dart';
import 'package:semo/data/model/categoriesmodel.dart';
import 'package:semo/data/model/foodrestaurants_model.dart';
// import 'package:semo/linkapi.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata_controller.dart';

class FoodHomeController extends GetxController {
  List foodHome = []; //متغير لتخزين البيانات بعد جلبها من ال backend .
  List foodLast = []; //متغير لتخزين البيانات بعد جلبها من ال backend .

  CategoriesModel? categoriesModel;
  HomeData homedata = HomeData(Get.find());
  late FoodRestaurantsModel foodRestaurantsModel;

  late StatusRequiest statusRequiest;

  @override
  void onInit()async {
   await getFood();
    await topFood();

    super.onInit();
  }

  topFood() async {
    statusRequiest = StatusRequiest.loading;
    var response = await homedata
        .foodLast(); //getData from "Data folder" not "controller folder"
    statusRequiest = handlingData(response);
    if (StatusRequiest.success == statusRequiest) {
      foodLast.addAll(response['data']);
    }
    update();
  }

   getFood() async {
    statusRequiest = StatusRequiest.loading;
    var response = await homedata
        .foodLast(); //getData from "Data folder" not "controller folder"
    statusRequiest = handlingData(response);
    if (StatusRequiest.success == statusRequiest) {
      foodHome.addAll(response['data']);
    }
    update();
  }


  // Future topFood() async{
  //   statusRequiest = StatusRequiest.loading;
  //   try{
  //   var response = await http.post(Uri.parse(AppLink.restaurantLast)); //getData from "Data folder" not "controller folder"
  //   statusRequiest= handlingData(response);

  //   // if(StatusRequiest.success== statusRequiest){
  //     if (response.statusCode == 200) {
  //       final jsondata = jsonDecode(response.body);
  //       foodLast.addAll(jsondata['data']);
  //       statusRequiest = StatusRequiest.success;
  //     } else {
  //       statusRequiest = StatusRequiest.faliure;
  //     }
  //   } catch (e) {
  //     statusRequiest = StatusRequiest.serverException;
  //   }
  //   update();
  // }

  // Future getFood() async {
  //   statusRequiest = StatusRequiest.loading;
  //   try {
  //     var response = await http.post(Uri.parse(AppLink
  //         .restaurantHome)); //getData from "Data folder" not "controller folder"
  //     statusRequiest = handlingData(response);

  //     // if(StatusRequiest.success== statusRequiest){
  //     if (response.statusCode == 200) {
  //       final jsondata = jsonDecode(response.body);
  //       foodHome.addAll(jsondata['data']);
  //       statusRequiest = StatusRequiest.success;
  //     } else {
  //       statusRequiest = StatusRequiest.faliure;
  //     }
  //   } catch (e) {
  //     statusRequiest = StatusRequiest.serverException;
  //   }
  //   update();
  // }

  goToProductPage(foodRestaurantsModel) {
    Get.toNamed("foodDetails",
        arguments: {"foodRestaurantsModel": foodRestaurantsModel});
  }

  goToMenu(categories, categoryid, categoriesName, foodRestaurantsModel) {
    Get.toNamed(AppRoutes.menuPage, arguments: {
      "categories": categories,
      "catid": categoryid, //the space have big baaaaad effect
      "categoriesname": categoriesName,
      "foodRestaurantsModel": foodRestaurantsModel,
    });
  }

  goToDetails(items, selecteditems, itemsid) {
    Get.toNamed(AppRoutes.pages, arguments: {
      "items": items,
      "selecteditems": selecteditems,
      "itemsid": itemsid, //the space have big baaaaad effect
    });
  }
}
