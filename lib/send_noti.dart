import 'package:flutter/material.dart';
import 'package:semo/noti.dart';

class SendNotificationTopic extends StatelessWidget {
  const SendNotificationTopic({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationService noti = NotificationService();
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          TextButton(
              onPressed: () => noti.sendFCMMessage(),
              child: const Text('ارسال')),
        ],
      )),
    );
  }
}
