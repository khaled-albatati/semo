import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:semo/data/model/restaurantmodel.dart';
import '../core/class/statusrequiest.dart';
import '../core/constant/routes.dart';
import '../core/functions/handlingdata_controller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/home_data.dart';
import '../data/model/categoriesmodel.dart';
import '../linkapi.dart';
// import 'home/food_controller.dart';

class AllController extends GetxController {
  MyServices myServices = Get.find();
  HomeData homedata =HomeData(Get.find());
  CategoriesModel? categoriesModel;
  RestaurantModel? restaurantModel;
  // FoodHomeController? foodHomeController;

  late StatusRequiest statusRequiest;
  List categories = []; //متغير لتخزين البيانات بعد جلبها من ال backend .
   List foodHome = []; //متغير لتخزين البيانات بعد جلبها من ال backend .
  List foodLast = []; //متغير لتخزين البيانات بعد جلبها من ال backend .
   List restaurant= [] ;  //متغير لتخزين البيانات بعد جلبها من ال backend .
  List restaurantLast = [] ;  //متغير لتخزين البيانات بعد جلبها من ال backend .
  List restaurantHome =[];
  // List restaurant = [] ;  //متغير لتخزين البيانات بعد جلبها من ال backend .

bool isLoading = true;

  Future<void> loadData() async {
    // Simulating an asynchronous data loading operation
    await Future.delayed(const Duration(seconds: 2));
    await getCategories();
  // await  getFood();
  await topFood();
   await getRestaurant();
    
    // Data loading complete, update isLoading
    isLoading = false;
    
    // Notify listeners that the data has changed
    update();
  }

 
@override
  void onInit()async {
    loadData();
    super.onInit();
  }

    Future getCategories() async {
    statusRequiest = StatusRequiest.loading;
      var response = await homedata.getCategories(); //getData from "Data folder" not "controller folder"
      statusRequiest = handlingData(response);

      if (StatusRequiest.success == statusRequiest) {
        categories.addAll(response['categories']['data']);
        print('here ========================:');
    print(categories);
  }
    update();
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

  //  getFood() async {
  //   statusRequiest = StatusRequiest.loading;
  //   var response = await homedata
  //       .topFood(); //getData from "Data folder" not "controller folder"
  //   statusRequiest = handlingData(response);
  //   if (StatusRequiest.success == statusRequiest) {
  //     foodHome.addAll(response['data']);
  //   }
  //   update();
  // }

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
  goToMenu1(categories, categoryid, categoriesName, foodRestaurantsModel) {
    Get.toNamed(AppRoutes.menuPage, arguments: {
      "categories": categories,
      "catid": categoryid, //the space have big baaaaad effect
      "categoriesname": categoriesName,
      "foodRestaurantsModel": restaurantModel,
    });
  }

  goToDetails(items, selecteditems, itemsid) {
    Get.toNamed(AppRoutes.pages, arguments: {
      "items": items,
      "selecteditems": selecteditems,
      "itemsid": itemsid, //the space have big baaaaad effect
    });}

     goToCategories(categories, categoryid) {
    Get.toNamed(AppRoutes.restaurantCategories, arguments: {
      "categories": categories,
      "catid": categoryid, //the space have big baaaaad effect
    });
  }

}