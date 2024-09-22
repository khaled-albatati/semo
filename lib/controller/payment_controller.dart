import 'package:get/get.dart';

class PaymentController extends GetxController {
  final arguments = Get.arguments as Map<String, dynamic>;
  @override
  void onInit() {
final double orderPrice = arguments['order_price'];
    print(orderPrice);
    super.onInit();
  }
}