import 'dart:convert';
import 'package:get/get.dart';
import 'package:semo/core/class/statusrequiest.dart';
import 'package:http/http.dart' as http;
// import 'package:semo/data/model/restaurantmodel.dart';
import 'package:semo/linkapi.dart';
import '../../core/functions/handlingdata_controller.dart';
import '../../core/constant/routes.dart';

//صفحة عرض المطاعم بعد اختيار الكاتيقوري

class RestaurantsHomeController extends GetxController{
  List restaurant= [] ;  //متغير لتخزين البيانات بعد جلبها من ال backend .
  List restaurantLast = [] ;  //متغير لتخزين البيانات بعد جلبها من ال backend .
  // List data=[];

  // RestaurantModel? restaurantmodel;
  late StatusRequiest statusRequiest;
  // int? id;
  String? catid;
  // int? selectedCat;



@override
  void onInit(){
statusRequiest = StatusRequiest.loading;
    // restaurantmodel= Get.arguments['restaurantModel'];
    // data = Get.arguments['categories'];
    // selectedCat = Get.arguments['selectedcat'];
  

    // getRestaurant();
    topRestaurant();
    super.onInit();
  }
  

  Future getRestaurant(String categoriesid) async{
    statusRequiest = StatusRequiest.loading;
    try{
    var response = await http.post(Uri.parse(AppLink.restaurantCategories),body: {
      "id":categoriesid
    }); //getData from "Data folder" not "controller folder"
    statusRequiest= handlingData(response); 
    
    // if(StatusRequiest.success== statusRequiest){
      if (response.statusCode == 200) {
        final jsondata = jsonDecode(response.body);
        restaurant.addAll(jsondata['data']);
        statusRequiest = StatusRequiest.success;
      } else {
        statusRequiest = StatusRequiest.faliure;
      }
    } catch (e) {
      statusRequiest = StatusRequiest.serverException;
    }
    update();
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
  // goToProductPage(foodRestaurantsModel) {
  //   Get.toNamed("menu", arguments: {"menu": foodRestaurantsModel});
  // }
    goToMenu(categories,categoryid,categoriesName,foodRestaurantsModel) {
    Get.toNamed(AppRoutes.menuPage, arguments: {
      "categories": categories,
      "catid": categoryid, //the space have big baaaaad effect
      "categoriesname":categoriesName,
      "foodRestaurantsModel":foodRestaurantsModel,
      
    });
  }
  // goToDetails(items, selecteditems, itemsid) {
  //   Get.toNamed(AppRoutes.pages, arguments: {
  //     "items": items,
  //     "selecteditems": selecteditems,
  //     "itemsid": itemsid, //the space have big baaaaad effect
  //   });
  // }
}