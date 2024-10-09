import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:semo/core/class/statusrequiest.dart';
import 'package:semo/core/constant/routes.dart';
import 'package:semo/core/services/services.dart';
import 'package:semo/data/datasource/remote/address_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:semo/data/model/addressmodel_price.dart';
import 'package:semo/linkapi.dart';
import 'package:http/http.dart' as http;

import '../../core/functions/handlingdata_controller.dart';

class AddAddressDetailsController extends GetxController {
  StatusRequiest statusRequest = StatusRequiest.none;

  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();
  List<AddressModelPrice> data =[];

  String? name;
  String? selectedLocation;

  TextEditingController? street;
  TextEditingController? lat;
  TextEditingController? long;

  intialData() {
    street = TextEditingController();
    lat = TextEditingController();
    long = TextEditingController();
  }

  addAddress() async {
    statusRequest = StatusRequiest.loading;
    update();

    var response = await http.post(Uri.parse(AppLink.addressAdd), body: {
      "usersid": myServices.sharedPreferences.getInt("id").toString(),
      "name": selectedLocation,
      "city":'المكلا',
      "street": street!.text,
      "lat": lat!.text,
      "long": long!.text
    });

    if (kDebugMode) {
      print("=============================== Controller $response ");
    }

    if (response.statusCode == 200) {
      Get.offAllNamed(AppRoutes.addressview);
    } else {
      statusRequest = StatusRequiest.faliure;
    }
    // End

    update();
  }

  Future getLocations() async {
    statusRequest = StatusRequiest.loading;
    var response = await http.post(Uri.parse(AppLink.addAddressPrice),);
    statusRequest = handlingData(response);

    if (response.statusCode == 200) {
      final jsondata = jsonDecode(response.body);
      List listdata = jsondata['data'];
      data.addAll(listdata.map((e) => AddressModelPrice.fromJson(e)));
      statusRequest = StatusRequiest.success;
    } else {
      statusRequest = StatusRequiest.faliure;
    }

    update();
  }

  @override
  void onInit() {
    getLocations();
    intialData();
    super.onInit();
  }
}
