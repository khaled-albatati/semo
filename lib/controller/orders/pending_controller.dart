import 'dart:convert';
import 'package:semo/core/services/services.dart';
import 'package:semo/data/datasource/remote/orders/pending_data.dart';
import 'package:semo/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:semo/linkapi.dart';
import 'package:http/http.dart' as http;
import '../../core/class/statusrequiest.dart';

// import '../core/functions/handlingdata_controller.dart';
class OrdersPendingController extends GetxController {
  OrdersPendingData ordersPendingData = OrdersPendingData(Get.find());

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

  // getOrders() async {
  //   data.clear();
  //   statusRequest = StatusRequiest.loading;
  //   update();
  //   var response = await ordersPendingData
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
      var response = await http.post(Uri.parse(AppLink.pendingorders),
          body: {"id": myServices.sharedPreferences.getInt('id').toString()});
      // print("=============================== Controller $response ");
      if (response.statusCode == 200) {
        final jsondata = jsonDecode(response.body);
        // print('==================JsonData  : $jsondata');
        List listdata = jsondata['data'];
        // print('==================ListData  : $listdata');
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
        // print('==================Data   :$data');
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
  Future deleteOrder(String orderid) async {
    data.clear();
    statusRequest = StatusRequiest.loading;
    update();
    try {
      var response = await http
          .post(Uri.parse(AppLink.ordersdelete), body: {"id": orderid});
      // print("=============================== Controller $response ");

      // Start backend
      if (response.statusCode == 200) {
        refrehOrder();
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

  refrehOrder() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
