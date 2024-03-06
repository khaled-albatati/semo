// import 'package:semo/core/class/statusrequest.dart';
// import 'package:semo/core/functions/handingdatacontroller.dart';
import 'dart:convert';
import 'package:semo/core/constant/routes.dart';
import 'package:semo/core/services/services.dart';
import 'package:semo/data/datasource/remote/address_data.dart';
import 'package:semo/data/datasource/remote/checkout_date.dart';
import 'package:semo/data/model/addressmodel.dart';
import 'package:get/get.dart';
import 'package:semo/linkapi.dart';
import 'package:http/http.dart' as http;
import '../core/class/statusrequiest.dart';

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));
  MyServices myServices = Get.find();
  StatusRequiest statusRequest = StatusRequiest.none;
  String? paymentMethod;
  String? deliveryType;
  String? deliveryType1;
  String addressid = "0";
  late String couponid;
  late String coupondiscount;
  late String priceorders;
  List<AddressModel> dataaddress = [];

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseDeliveryType1(String val) {
    deliveryType1 = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressid = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequiest.loading;
    final usersid = myServices.sharedPreferences.getString('id');
    var response = await http
        .post(Uri.parse(AppLink.addressView), body: {"usersid": usersid});

    // print("=============================== Controller $response ");

    if (response.statusCode == 200) {
      final jsonbody = jsonDecode(response.body);
      List listdata = jsonbody['data'];
      dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      statusRequest = StatusRequiest.success;
    } else {
      statusRequest = StatusRequiest.faliure;
    }
    // End

    update();
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar(
          "Note", "Please select a payment method & order receive Type");
    }
    if (deliveryType == null) {
      return Get.snackbar("Note", "Please select a order receive Type");
    }

    statusRequest = StatusRequiest.loading;

    update();

    var response = await http.post(Uri.parse(AppLink.checkout), body: {
      "usersid": myServices.sharedPreferences.getString("id"),
      "addressid": addressid.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": "10",
      "ordersprice": priceorders,
      "couponid": couponid,
      "coupondiscount": coupondiscount.toString(),
      "paymentmethod": paymentMethod.toString()
    });

    // print("=============================== Controller $response ");

    if (response.statusCode == 200) {
      statusRequest = StatusRequiest.success;
      Get.offAllNamed(AppRoutes.navbar);
      Get.snackbar("تم", "تم الطلب بنجاح");
    } else {
      statusRequest = StatusRequiest.none;
      Get.snackbar("هناك خطأ", "حاول مرة اخرى");
    }
    // End

    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorders = Get.arguments['priceorder'];
    coupondiscount = Get.arguments['discountcoupon'].toString();
    getShippingAddress();
    super.onInit();
  }
}
