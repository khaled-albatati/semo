import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/controller/navbar_controller.dart';
import 'package:semo/view/widget_view/navbar/widgetbutton_navbar.dart';
import '../const/colors.dart';
import '../core/services/services.dart';
import '../utils/helper.dart';
import 'login_screen.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NavBarControllerImp());
    MyServices myServices = Get.find();

    return Visibility(
      visible: myServices.sharedPreferences.getInt('id') != null &&
          myServices.sharedPreferences.getInt('userAprove') == 0,
      replacement: const LoginScreen(),
      child: GetBuilder<NavBarControllerImp>(
        builder: (controller) => Scaffold(
          resizeToAvoidBottomInset: false, // Prevent resizing
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.changePage(0);
            },
            backgroundColor: AppColor.firstColor,
            child: const Icon(Icons.home),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 4,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    Helper.getAssetName("splashIcon.png", "virtual"),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Row(
                    children: [
                      WidgetButtonNavBar(
                        onPressed: () {
                          controller.changePage(1);
                        },
                        text: "مرسال",
                        icon: Icons.motorcycle_outlined,
                        active: controller.currentPage == 1,
                      ),
                      WidgetButtonNavBar(
                        onPressed: () {
                          controller.changePage(2);
                        },
                        text: "اسر منتجة",
                        icon: Icons.storefront_sharp,
                        active: controller.currentPage == 2,
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Spacer(),
                  Row(
                    children: [
                      WidgetButtonNavBar(
                        onPressed: () {
                          controller.changePage(3);
                        },
                        text: "المطاعم",
                        icon: Icons.restaurant_menu,
                        active: controller.currentPage == 3,
                      ),
                      WidgetButtonNavBar(
                        onPressed: () {
                          controller.changePage(4);
                        },
                        text: "10".tr,
                        icon: Icons.settings_outlined,
                        active: controller.currentPage == 4,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: WillPopScope(
            child: SingleChildScrollView(
              // Allows scrolling when keyboard appears
              child: Column(
                children: [
                  // Add your dynamic content here
                  SizedBox(
                    height: MediaQuery.of(context).size.height, // Full height
                    child:
                        controller.listpage.elementAt(controller.currentPage),
                  ),
                ],
              ),
            ),
            onWillPop: () {
              Get.defaultDialog(
                title: "الخروج",
                middleText: "هل تريد الخروج؟",
                confirmTextColor: Colors.white,
                cancelTextColor: AppColor.firstColor,
                buttonColor: AppColor.firstColor,
                textConfirm: "الخروج",
                textCancel: "الاستمرار",
                onCancel: () {},
                onConfirm: () {
                  exit(0);
                },
              );
              return Future.value(false);
            },
          ),
        ),
      ),
    );
  }
}
