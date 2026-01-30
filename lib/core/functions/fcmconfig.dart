import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

import '../constant/routes.dart';

requestPermissionNotification() async {
  // ignore: unused_local_variable
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmconfig() {
  FirebaseMessaging.onBackgroundMessage(
      (message) => backgroundHandler(message));
  FirebaseMessaging.onMessage.listen(
    (message) {
      if (kDebugMode) {
        print("you are in the app");
      }
      // FlutterRingtonePlayer.playNotification();
      Get.snackbar(message.notification!.title!, message.notification!.body!);
    },
  );
  FirebaseMessaging.onMessageOpenedApp.listen(
    (message) {
      if (kDebugMode) {
        print("you opened the app from background notification");
      }
      // Handle the tap action here
      // For example, you can navigate to the desired page using Get.toNamed
      Get.toNamed(AppRoutes.navbar);
    },
  );
}

Future<void> backgroundHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print("you are outside the app");
  }
  // Perform any necessary background tasks
}
