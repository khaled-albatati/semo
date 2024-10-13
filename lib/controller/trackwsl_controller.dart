import 'dart:convert';
import 'package:semo/core/services/services.dart';
import 'package:get/get.dart';
import 'package:semo/data/model/orderwsl_model.dart';
import 'package:semo/linkapi.dart';
import 'package:http/http.dart' as http;
import '../../core/class/statusrequiest.dart';

// import '../core/functions/handlingdata_controller.dart';
class TrackWslController extends GetxController {
  List<OrderWsl> data = [];

  late StatusRequiest statusRequest;

  MyServices myServices = Get.find();

  String printOrderType(String val) {
    if (val == "0") {
      return "delivery";
    } else {
      return "Recive";
    }
  }

  String coupon(String val) {
    if (val == "0") {
      return "No";
    } else {
      return "Yes";
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
    if (val == "1") {
      return "في انتظار الموافقه";
    } else if (val == "2") {
      return "تمت الموافقه , قيد التجهيز انتظر 90 دقيقة";
    } else if (val == "3") {
      return "تمت استلام الطلب والمندوب على الطريق";
    } else if (val == "4") {
      return "تم توصيل الطلب";
    } else {
      return "Archive";
    }
  }

  Future getOrders() async {
    data.clear();
    statusRequest = StatusRequiest.loading;
    update();
    try {
      var response = await http.post(Uri.parse(AppLink.trackWsl),
          body: {"id": myServices.sharedPreferences.getInt('id').toString()});
      // print("=============================== Controller $response ");
      if (response.statusCode == 200) {
        final jsondata = jsonDecode(response.body);
        List listdata = jsondata['data'];
        data.addAll(listdata.map((e) => OrderWsl.fromJson(e)));
        data = data.reversed.toList();

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

  // deleteOrder(String orderid) async {
  //   data.clear();
  //   statusRequest = StatusRequiest.loading;
  //   update();
  //   var response = await ordersPendingData.deleteData(orderid);
  //   // print("=============================== Controller $response ");
  //   statusRequest = handlingData(response);
  //   if (StatusRequiest.success == statusRequest) {
  //     // Start backend
  //     if (response['status'] == "success") {
  //       refrehOrder();
  //     } else {
  //       statusRequest = StatusRequiest.faliure;
  //     }
  //     // End
  //   }
  //   update();
  // }
  // Future deleteOrder(String orderid) async {
  //   data.clear();
  //   statusRequest = StatusRequiest.loading;
  //   update();
  //   try {
  //     var response = await http
  //         .post(Uri.parse(AppLink.ordersdelete), body: {"id": orderid});
  //     // print("=============================== Controller $response ");

  //     // Start backend
  //     if (response.statusCode == 200) {
  //       refrehOrder();
  //       statusRequest = StatusRequiest.success;
  //     } else {
  //       statusRequest = StatusRequiest.faliure;
  //     }
  //     // End
  //   } catch (e) {
  //     statusRequest = StatusRequiest.serverException;
  //   }
  //   update();
  // }

  refrehOrder() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
