import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/controller/payment_controller.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  
  @override
  Widget build(BuildContext context) {
  PaymentController controller=  Get.put(PaymentController());
    return Scaffold(body: Center(child: Text(controller.arguments['order_price'].toString()),));
  }
}