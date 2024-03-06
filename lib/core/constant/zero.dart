import 'package:get/get.dart';
import 'package:http/http.dart'as http;

import '../../linkapi.dart';
import '../class/statusrequiest.dart';
import '../services/services.dart';
  late StatusRequiest statusRequiest;
  MyServices myServices = Get.find();

onBackInit()async{
  
    // statusRequiest = StatusRequiest.loading;
    try {
      final response = await http.post(Uri.parse(AppLink.deleteCount), body: {
        'usersid': myServices.sharedPreferences.getString('id')!
      });
      // statusRequiest = handlingData(response);
      if (response.statusCode == 200) {
        // Get.rawSnackbar(
        //     title: "اشعار", messageText: const Text("تم ازالة وجبة"));
        statusRequiest = StatusRequiest.success;
      } else {
        statusRequiest = StatusRequiest.faliure;
      }
    } catch (e) {
      statusRequiest = StatusRequiest.serverException;
    }
  }