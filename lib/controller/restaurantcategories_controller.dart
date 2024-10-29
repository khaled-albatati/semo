import 'dart:convert';
import 'package:get/get.dart';
import 'package:semo/core/class/statusrequiest.dart';
import 'package:http/http.dart' as http;
// import 'package:semo/data/model/restaurantmodel.dart';
import 'package:semo/linkapi.dart';
import '../../core/functions/handlingdata_controller.dart';
import '../core/constant/routes.dart';

//صفحة عرض المطاعم بعد اختيار الكاتيقوري

class RestaurantCategoriesController extends GetxController{
  List restaurant= [] ;  //متغير لتخزين البيانات بعد جلبها من ال backend .
  List restaurantLast = [] ;  //متغير لتخزين البيانات بعد جلبها من ال backend .
  List data=[];

  // RestaurantModel? restaurantmodel;
  late StatusRequiest statusRequiest;
  // int? id;
  int? catid;
  // int? selectedCat;


bool isLoading = true;

  Future<void> loadData() async {
    // Simulating an asynchronous data loading operation
    await Future.delayed(const Duration(seconds: 2));
    
    // Data loading complete, update isLoading
    await getRestaurant(catid.toString());
    await topRestaurant();
    isLoading = false;
    
    // Notify listeners that the data has changed
    update();
  }


@override
  void onInit(){
statusRequiest = StatusRequiest.loading;
    // restaurantmodel= Get.arguments['restaurantModel'];
    data = Get.arguments['categories'];
    // selectedCat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'];

loadData();    // getRestaurant();
    // topRestaurant();
    super.onInit();
  }
  

  Future getRestaurant(String categoriesid) async{
    statusRequiest = StatusRequiest.loading;
    print('==================================: $categoriesid');
    try{
    var response = await http.post(Uri.parse(AppLink.restaurantCategories),body: {
      "id":categoriesid.toString()
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

  //Y
    goToMenu(categories,categoryid,categoriesName,foodRestaurantsModel,restaurantsLocation) {
    Get.toNamed(AppRoutes.menuPage, arguments: {
      "categories": categories,
      "catid": categoryid, //the space have big baaaaad effect
      "categoriesname":categoriesName,
      "foodRestaurantsModel":foodRestaurantsModel,
      "restaurants_location":restaurantsLocation
      
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