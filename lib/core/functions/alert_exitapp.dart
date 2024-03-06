import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(title: "99".tr, middleText: "100".tr, actions: [
    ElevatedButton(
        onPressed: () {
          exit(0);
        },
        child: Text("102".tr)),
    ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text("101".tr))
  ]);
  return Future.value(true);
}
