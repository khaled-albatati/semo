import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:semo/routes.dart';
import './const/colors.dart';
import 'bindings/initialbindings.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';
import 'firebase_options.dart';

void main() async {
  Jiffy.locale('ar');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // LocaleController controller =
    Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'semo',
      translations: MyTranslation(),
      locale: const Locale('ar'),
      theme: ThemeData(
        fontFamily: "Metropolis",
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColor.orange,
        ),
        // primarySwatch: AppColor.firstColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              AppColor.orange,
            ),
            shape: WidgetStateProperty.all(
              const StadiumBorder(),
            ),
            elevation: WidgetStateProperty.all(0),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(
              AppColor.orange,
            ),
          ),
        ),useMaterial3: false,
        textTheme: const TextTheme(
          displaySmall: TextStyle(
            color: AppColor.primary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            color: AppColor.secondary,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          headlineSmall: TextStyle(
            color: AppColor.primary,
            fontWeight: FontWeight.normal,
            fontSize: 25,
          ),
          titleLarge: TextStyle(
            color: AppColor.primary,
            fontSize: 25,
          ),
          bodyMedium: TextStyle(
            color: AppColor.secondary,
          ),
        ),
      ),
      // home: HomeScreen(),
      initialBinding: InitialBindings(),
      getPages: routes,
    );
  }
}
