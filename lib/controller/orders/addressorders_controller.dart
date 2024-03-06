import 'package:semo/core/class/statusrequiest.dart';
import 'package:semo/core/constant/routes.dart';
import 'package:semo/core/services/services.dart';
import 'package:semo/data/datasource/remote/address_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:semo/data/model/addressmodel_price.dart';
import 'package:semo/linkapi.dart';
import 'package:http/http.dart' as http;

class AddAddressDetailsController extends GetxController {
  StatusRequiest statusRequest = StatusRequiest.none;
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();
  List<AddressModelPrice> data = [];
  String? selectedLocation;
  TextEditingController? details;

  intialData() {
    details = TextEditingController();
  }

  addAddress(selectedLocation, selectedLocation1, price) async {
    statusRequest = StatusRequiest.loading;
    update();
    var response = await http.post(Uri.parse(AppLink.addressOrders), body: {
      "userid": myServices.sharedPreferences.getString("id")!,
      "source": selectedLocation,
      "destination": selectedLocation1,
      "price": price,
      "details": details,
    });
    if (response.statusCode == 200) {
      Get.offAllNamed(AppRoutes.addressview);
    } else {
      statusRequest = StatusRequiest.faliure;
    }
    // End

    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
