import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ConfigurationController extends GetxController {
  bool isSubscribed = false;
  bool isSending = false;

  // Time variables
  TimeOfDay openDay = const TimeOfDay(hour: 9, minute: 0);
  TimeOfDay closeDay = const TimeOfDay(hour: 17, minute: 0);
  TimeOfDay openNight = const TimeOfDay(hour: 18, minute: 0);
  TimeOfDay closeNight = const TimeOfDay(hour: 22, minute: 0);

  void toggleSubscription() {
    isSubscribed = !isSubscribed;
    // Add Firebase subscription logic here
    update();  // Notify listeners for UI update
  }

  void sendData() async {
    isSending = true;
    update();  // Notify listeners for UI update

    final response = await http.post(
      Uri.parse('https://www.test.com/restaurants.php'),
      body: {
        'status': isSending ? '1' : '0',
        'openDay': openDay.format(Get.context!),
        'closeDay': closeDay.format(Get.context!),
        'openNight': openNight.format(Get.context!),
        'closeNight': closeNight.format(Get.context!),
      },
    );

    isSending = false;
    update();  // Notify listeners for UI update
    // Handle the response as needed
  }

  void setTime(TimeOfDay time, String type) {
    switch (type) {
      case 'openDay':
        openDay = time;
        break;
      case 'closeDay':
        closeDay = time;
        break;
      case 'openNight':
        openNight = time;
        break;
      case 'closeNight':
        closeNight = time;
        break;
    }
    update();  // Notify listeners for UI update
  }
}