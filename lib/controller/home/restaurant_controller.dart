import 'dart:convert';
import 'package:get/get.dart';
import 'package:semo/core/class/statusrequiest.dart';
import 'package:http/http.dart' as http;
import 'package:semo/data/model/categoriesmodel.dart';
import 'package:semo/data/model/foodrestaurants_model.dart';
import 'package:semo/linkapi.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata_controller.dart';

//كنترولر عرض المطاعم في الهوم

//ارسال التفاصيل للكنترولر الاخر

class RestaurantHomeController extends GetxController{
  List restaurantHome= [] ;  //متغير لتخزين البيانات بعد جلبها من ال backend .
  List restaurantLast = [] ;  //متغير لتخزين البيانات بعد جلبها من ال backend .

  CategoriesModel? categoriesModel;
  late FoodRestaurantsModel foodRestaurantsModel;

  late StatusRequiest statusRequiest;

@override
  void onInit(){
    getRestaurant();
    topRestaurant();
    super.onInit();
  }
  Future topRestaurant() async{
    statusRequiest = StatusRequiest.loading;
    try{
    var response = await http.post(Uri.parse(AppLink.restaurantLast)); //getData from "Data folder" not "controller folder"
    statusRequiest= handlingData(response); 
    
    // if(StatusRequiest.success== statusRequiest){
      if (response.statusCode == 200) {
        final jsondata = jsonDecode(response.body);
        restaurantLast.addAll(jsondata['data']);
        statusRequiest = StatusRequiest.success;
      } else {
        statusRequiest = StatusRequiest.faliure;
      }
    } catch (e) {
      statusRequiest = StatusRequiest.serverException;
    }
    update();
  }
  

  Future getRestaurant() async{
    statusRequiest = StatusRequiest.loading;
    try{
    var response = await http.post(Uri.parse(AppLink.restaurantHome)); //getData from "Data folder" not "controller folder"
    statusRequiest= handlingData(response); 
    
    // if(StatusRequiest.success== statusRequiest){
      if (response.statusCode == 200) {
        final jsondata = jsonDecode(response.body);
        restaurantHome.addAll(jsondata['data']);
        statusRequiest = StatusRequiest.success;
      } else {
        statusRequiest = StatusRequiest.faliure;
      }
    } catch (e) {
      statusRequiest = StatusRequiest.serverException;
    }
    update();
  }

  
  goToProductPage(foodRestaurantsModel) {
    Get.toNamed("foodDetails", arguments: {"foodRestaurantsModel": foodRestaurantsModel});
  }
  goToDetails(items, selecteditems, itemsid) {
    Get.toNamed(AppRoutes.pages, arguments: {
      "items": items,
      "selecteditems": selecteditems,
      "itemsid": itemsid, //the space have big baaaaad effect
    });
  }
}