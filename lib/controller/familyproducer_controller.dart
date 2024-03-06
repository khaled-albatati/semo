import 'dart:convert';
import 'package:get/get.dart';
import 'package:semo/controller/home/food_controller.dart';
import 'package:semo/core/class/statusrequiest.dart';
import 'package:http/http.dart' as http;
import 'package:semo/linkapi.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata_controller.dart';

//kinds of food
class FamilyProducerController extends GetxController {
  List family = []; //متغير لتخزين البيانات بعد جلبها من ال backend .
  FoodHomeController? foodHomeController;
  late StatusRequiest statusRequiest;

  @override
  void onInit() {
    getFamily();
    super.onInit();
  }

  Future getFamily() async {
    statusRequiest = StatusRequiest.loading;
    try {
      var response = await http.post(Uri.parse(AppLink
          .menufamily)); //getData from "Data folder" not "controller folder"
      statusRequiest = handlingData(response);

      // if(StatusRequiest.success== statusRequiest){
      if (response.statusCode == 200) {
        final jsondata = jsonDecode(response.body);
        family.addAll(jsondata['data']);
        statusRequiest = StatusRequiest.success;
      } else {
        statusRequiest = StatusRequiest.faliure;
      }
    } catch (e) {
      statusRequiest = StatusRequiest.serverException;
    }
    update();
  }

  goToMenu(list, id, name, foodRestaurantsModel) {
    Get.toNamed(AppRoutes.menuPage, arguments: {
      "categories": list, //list
      "catid": id, //the space have big baaaaad effect Name
      "categoriesname": name,
      "foodRestaurantsModel": foodRestaurantsModel, //ID
    });
  }
}
