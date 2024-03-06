import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/controller/navbar_controller.dart';
// import 'package:semo/core/constant/color.dart';
import 'package:semo/view/widget_view/navbar/widgetbutton_navbar.dart';
import '../const/colors.dart';
import '../core/services/services.dart';
import 'login_screen.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(NavBarControllerImp());
    MyServices myServices = Get.find();
    // myServices.sharedPreferences.getString("id");
     return Visibility(
      visible: myServices.sharedPreferences.getString('id')!=null,replacement:  const LoginScreen(),
      child: GetBuilder<NavBarControllerImp>(
      builder: ((controller) => Scaffold(
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
                        active: controller.currentPage == 1 ? true : false,

                        // color: AppColor.primarycolor
                      ),
                      WidgetButtonNavBar(
                        onPressed: () {
                          controller.changePage(2);
                        },
                        text: "اسر منتجة",
                        icon: Icons.storefront_sharp,
                        active: controller.currentPage == 2 ? true : false,
                        // color: AppColor.primarycolor
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Spacer(),
                  // const Spacer(),
                  Row(children: [
                    WidgetButtonNavBar(
                      onPressed: () {
                        controller.changePage(3);
                      },
                      text: "المطاعم",
                      icon: Icons.restaurant_menu,
                      active: controller.currentPage == 3 ? true : false,
                      // color: AppColor.primarycolor
                    ),
                    WidgetButtonNavBar(
                      onPressed: () {
                        controller.changePage(4);
                      },
                      text: "10".tr,
                      icon: Icons.settings_outlined,
                      active: controller.currentPage == 4 ? true : false,

                      // color: AppColor.primarycolor
                    ),
                  ]),
                ],
              ),
            ),
            body: WillPopScope(
              child: controller.listpage.elementAt(controller.currentPage),
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
                    });
                return Future.value(false);
              },
            ),
          )),
    ));
  }
}
