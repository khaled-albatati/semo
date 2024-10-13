// import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:semo/data/datasource/remote/orders/details_data.dart';
import 'package:semo/data/model/cartmodel.dart';
import 'package:semo/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:semo/linkapi.dart';
import '../../core/class/statusrequiest.dart';
import 'package:http/http.dart' as http;
import '../../core/services/services.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetailsController extends GetxController {
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());

  List<CartModel> data = [];

  late StatusRequiest statusRequest;
  String x='';
  late OrdersModel ordersModel;
  MyServices myServices = Get.find();

  // Completer<GoogleMapController>? completercontroller;

  // List<Marker> markers = [];

  double? lat;
  double? long;

  // CameraPosition? cameraPosition;

  intialData() {
    if (ordersModel.ordersType == "0") {
      // cameraPosition = CameraPosition(
      //   target: LatLng(double.parse(ordersModel.addressLat!),
      //       double.parse(ordersModel.addressLong!)),
      //   zoom: 12.4746,
      //  );
      // markers.add(Marker(
      //     markerId: MarkerId("1"),
      //     position: LatLng(double.parse(ordersModel.addressLat!),
      //         double.parse(ordersModel.addressLong!))));
    }
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    x = ordersModel.ordersId.toString();
    intialData();
    getData();
    super.onInit();
  }

//   getData() async {
//     statusRequest = StatusRequiest.loading;

//     var response = await ordersDetailsData.getData(ordersModel.ordersId!);

//     if (kDebugMode) {
//       print("=============================== Controller $response ");
//     }

//     statusRequest = handlingData(response);

//     if (StatusRequiest.success == statusRequest) {
//       // Start backend
//       if (response['status'] == "success") {
//         List listdata = response['data'];
//         data.addAll(listdata.map((e) => CartModel.fromJson(e)));
//       } else {
//         statusRequest = StatusRequiest.faliure;
//       }
//       // End
//     }
//     update();
//   }
// }
  Future getData() async {
    statusRequest = StatusRequiest.loading;
    try {
      var response = await http.post(Uri.parse(AppLink.ordersdetails),
          body: {"id": x});
          


      if (response.statusCode == 200) {
        final jsondata = jsonDecode(response.body);
        List listdata = jsondata['data'];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      if (kDebugMode) {
        print("=============================== Controller $response ");
      }
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
}
