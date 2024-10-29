import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:http/http.dart' as http;
import 'firebase_options.dart';

class NotificationService {
  final String projectId = "semo-efca0";

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await requestNotificationPermission();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.notification?.title}');
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });

    final fcmToken = await FirebaseMessaging.instance.getToken();
    print('FCM Token: $fcmToken');
    FirebaseMessaging.instance.subscribeToTopic("users");
  }

  Future<void> requestNotificationPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    print('Notification permission granted: ${settings.authorizationStatus}');
  }

  Future<String> getAccessToken() async {
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": projectId,
        "private_key_id": "e4f90cd2de5fe464dba58e3f18b67ad32b4c26f0",
        "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDWpF0z5W++4mmD\nc7Y0sfl6GIt8EPCLOkYMRVDJ4D1EWrj1P8m9YPcKfxEq8nMPH1TI6g93zMBpDnKf\nIybO63wj8MySc0+dOtKLpyhJR/4raUBfJXeiK9x5aT76d6WB0BuPPzp6k+dZkHzf\n69EHxRrTNentFX+yEPwMpbBs1GnYtztaCCfOmUzxhxPaXbX88pXUGZxCfO5HwbNi\nEyH2OukG0P3RMBqEos4goEFhM9EcxcjkDrhITW72lN6ejkiQk6Te1Y1FuPnVA53W\njmKQTUMsAoMfkKvJNdijy56duHCKDSm+5KoC8O6TOSfs3bIjlyoyNKnMkTRroY0N\nZT6/miqnAgMBAAECggEAIfVKG5pKhiArAlWNt6OKrULx2nSRoe1bxLg4sl+sQcK6\nrW5km/YZz4rP7AQEqRlTYCALx2/Y5yYWg0/b5XPDJaqEqwzcRStXwSl2ibV+pF6Y\nBRWX6kvXK0w33weL41BJ8+1Ucq0wtm5SG1kjLoAEIPNQKaazl7fxMI0MLwOiJVt5\nsYOIqde/vVsZvVg1Vs0kJfmYv5Zb7a/t/EMrZqF8Rf0Ch2pEtgKFJMi0b8juMRzo\n6Jht0ojyzsLA0/wFSRvonF1SaH9rjfiYUNtWJqEO4l4ylFV2sIr0R3M8lM4ZDjkr\n9erHhR/Ai9qyjw5IEyUoq2BWdhmXw1jGUmNCEWhuaQKBgQDweRGikFJBQi/cS6uY\nYzcYEy/tc7x2LjD+cxIUk2VhXQH+TKuJ6NDUrFm0Z5Fui3FNhtnJNz33JvYyjg6a\nLULaWTyZxc90+f4vjeCZK9EPUuAtUInNYRhc0KCWXVT5X9+6mJI3PV1yqUtk3c6X\nYB9OlZ/zIvP7k1C3YuVoeS1VPwKBgQDkgFHuc3yrr9z2F8COCg+P/ym8aEj0vBRW\nkCQCcN+Od1KSU8WoSsG2UGq3YXjbU4QCiumLYYgFii1d47brNX+JWG2v8IDq87t9\nL4QMOspohscuLiHd7NI+q3D0Og0T+fbdRyqZlkzRCvh0drmAIX6znNoyFxnyo9X8\nCvlmb9fImQKBgBsVN5Q8dtccsjE4YIIQIoNWnd47W61ftGrj4NRqaU+W3wOZ9PPa\nQbLCGnRD+dAeaktV9a9AxnzQaYf2EdTxZgcbZ8TVz3CYOzV14CbAFZKJPfA8ktiL\np+fEI2Hr7wcK8jKcvlL0WVLxmCkrBfpse/ooxdPnSt05kSymOboTc7SXAoGACgKR\nFEgc4wyOOn2p4s8QBXfhJS7QW2BN58jiuvSk5oHVrTFcTFYSDGGTezsa50jOVKov\nNvrr0YpPGHjcT4uFbcfg7j8z9pb81KwbNcnxigi1exFsTGOOhk5OYXSVlBV0Ohdf\nB2FtNg8r+TYmRDWzbjzl1iHq8hU5T5RPfqxRoKkCgYBTSMg5VY4dRVt2sgaahvDt\np6j3tST/CTXnbjajvlrcUwA4ruryv16Mh4ZRbPvjdpaGKT03LHFG7Jk6muNjLEez\nlyIpD4f2TGe0OCsPV1/x81ewH39PpPlDB06ni5gtiWIcfarCsbhFIYInkvGrz4Sh\nMtyBXgn/CqFcwrKXVHmeSg==\n-----END PRIVATE KEY-----\n",
        "client_email": "firebase-adminsdk-oq4wl@semo-efca0.iam.gserviceaccount.com",
        "client_id": "115075396025297752540",
      "token_uri": "https://oauth2.googleapis.com/token",
    };

    final scopes = [
      "https://www.googleapis.com/auth/firebase.messaging",
    ];

    final client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
    );

    final credentials = await auth.obtainAccessCredentialsViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
      client,
    );

    client.close();
    return credentials.accessToken.data;
  }

  Future<void> sendFCMMessage(String topic, String title , String body) async {
    final serverKey = await getAccessToken();
    final currentFCMToken = await FirebaseMessaging.instance.getToken();
    final message = {
      'message': {
        'topic': topic,
        'notification': {
          'body': body,
          'title': title
        },
        'data': {
          'current_user_fcm_token': currentFCMToken,
        },
      }
    };

    final response = await http.post(
      Uri.parse('https://fcm.googleapis.com/v1/projects/$projectId/messages:send'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $serverKey',
      },
      body: jsonEncode(message),
    );

    if (response.statusCode == 200) {
      print('FCM message sent successfully');
    } else {
      print('Failed to send FCM message: ${response.statusCode}');
    }
}

@pragma('vm:entry-point')
static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}}