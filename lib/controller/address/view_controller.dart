import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:semo/core/class/statusrequiest.dart';
// import 'package:semo/core/constant/routes.dart';
import 'package:semo/core/services/services.dart';
import 'package:semo/data/datasource/remote/address_data.dart';
// import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:semo/linkapi.dart';
import 'package:http/http.dart' as http;
import '../../data/model/addressmodel.dart';

class AddressViewController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  List<AddressModel> data = [];
  late StatusRequiest statusRequest;
  MyServices myServices = Get.find();

  bool isLoading = true;

  Future<void> loadData() async {
    // Simulating an asynchronous data loading operation
    await getData();
    await Future.delayed(const Duration(seconds: 2));

    // Data loading complete, update isLoading
    isLoading = false;

    // Notify listeners that the data has changed
    update();
  }

  deleteAddress(String addressid) {
    addressData.deleteData(addressid);
    data.removeWhere((element) => element.addressId == addressid);
    update();
  }

  getData() async {
    statusRequest = StatusRequiest.loading;

    var response = await http.post(Uri.parse(AppLink.addressView),
        body: {"usersid": myServices.sharedPreferences.getString('id')});

    if (kDebugMode) {
      print("=============================== Controller $response ");
    }

    Map<String, dynamic> responseBody = json.decode(response.body);
    String status = responseBody['status'];
    if (status == 'success') {
      final jsondata = jsonDecode(response.body);
      // Start backend
      List listdata = jsondata['data'];
      data.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      statusRequest = StatusRequiest.success;
      if (data.isEmpty) {
        statusRequest = StatusRequiest.faliure;
      }
    } else {
      statusRequest = StatusRequiest.faliure;
    }
    // End
    update();
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
  }
}
