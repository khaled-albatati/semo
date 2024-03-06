import 'dart:convert';
// import 'package:dartz/dartz.dart';
import 'package:semo/core/services/services.dart';
import 'package:semo/data/datasource/remote/orders/archive_data.dart';
import 'package:semo/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:semo/linkapi.dart';
import 'package:http/http.dart' as http;
import '../../core/class/statusrequiest.dart';

class OrdersArchiveController extends GetxController {
  OrdersArchiveData ordersArchiveData = OrdersArchiveData(Get.find());

  List<OrdersModel> data = [];

  late StatusRequiest statusRequest;

  MyServices myServices = Get.find();

  String printOrderType(String val) {
    if (val == "0") {
      return "delivery";
    } else {
      return "Recive";
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash On Delivery";
    } else {
      return "Payment Card";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "The Order is being Prepared ";
    } else if (val == "2") {
      return "Ready To Picked up by Delivery man";
    } else if (val == "3") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  // getOrders() async {
  //   data.clear();
  //   statusRequest = StatusRequiest.loading;
  //   update();
  //   var response = await ordersArchiveData
  //       .getData(myServices.sharedPreferences.getString("id")!);
  //   // print("=============================== Controller $response ");
  //   statusRequest = handlingData(response);
  //   if (StatusRequiest.success == statusRequest) {
  //     // Start backend
  //     if (response['status'] == "success") {
  //       List listdata = response['data'];
  //       data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
  //     } else {
  //       statusRequest = StatusRequiest.faliure;
  //     }
  //     // End
  //   }
  //   update();
  // }

  Future getOrders() async {
    data.clear();
    statusRequest = StatusRequiest.loading;
    update();
    try {
      var response = await http.post(Uri.parse(AppLink.ordersarchive),
          body: {"id": myServices.sharedPreferences.getString("id")});
      // print("=============================== Controller $response ");
      if (response.statusCode == 200) {
        final jsondata = jsonDecode(response.body);
        // Start backend

        List listdata = jsondata['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
        statusRequest = StatusRequiest.success;
      } else {
        statusRequest = StatusRequiest.faliure;
      }
      // End
    } catch (e) {
      statusRequest = StatusRequiest.serverException;
    }
    update();
  }

  // submitRating(String ordersid, double rating, String comment) async {
  //   data.clear();
  //   statusRequest = StatusRequiest.loading;
  //   update();
  //   var response =
  //       await ordersArchiveData.rating(ordersid, comment, rating.toString());
  //   // print("=============================== Controller $response ");
  //   statusRequest = handlingData(response);
  //   if (StatusRequiest.success == statusRequest) {
  //     // Start backend
  //     if (response['status'] == "success") {
  //       getOrders();
  //       statusRequest = StatusRequiest.success;
  //       // print("success");
  //     } else {
  //       statusRequest = StatusRequiest.faliure;
  //     }
  //     // End
  //   }
  //   update();
  // }

  Future submitRating(String ordersid, double rating, String comment) async {
    data.clear();
    statusRequest = StatusRequiest.loading;
    update();
    try {
      var response = await http.post(Uri.parse(AppLink.rating), body: {
        "id": ordersid,
        "comment": comment,
        "rating": rating.toString()
      });
      // print("=============================== Controller $response ");
      if (response.statusCode == 200) {
        // final jsondata = jsonDecode(response.body);
        getOrders();
        statusRequest = StatusRequiest.success;
        // print("success");
      } else {
        statusRequest = StatusRequiest.faliure;
      }
    } catch (e) {
      statusRequest = StatusRequiest.serverException;
    }
    // End

    update();
  }

  refrehOrder() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
