import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/const/colors.dart';
import 'package:semo/controller/auth/profile_controller.dart';
import 'package:semo/core/constant/routes.dart';
import 'package:semo/utils/helper.dart';
// import 'package:social_share/social_share.dart';

import '../widgets/profile/widget_profile.dart';

class Profile extends GetView<ProfileControllerImp> {
  const Profile({super.key});

  // static const routeName = "/profileScreen";
  @override
  Widget build(BuildContext context) {
    // String applink='حمل تطبيق سيمو الان من خلال \n https://play.google.com/store/apps/details?id=com.semodelivery.semo.semo';
    Get.put(ProfileControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Helper.getAssetName("edit_filled.png", "virtual"),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "تعديل الحساب",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  Helper.getAssetName("splashIcon.png", "virtual"),
                ))),
        child: Stack(
          children: [
            SafeArea(
              child: SizedBox(
                // height: Helper.getScreenHeight(context),

                width: Helper.getScreenWidth(context),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text(
                        //       "Profile",
                        //       style: Helper.getTheme(context).headline5,
                        //     ),
                        //     // Image.asset(
                        //     //   Helper.getAssetName("cart.png", "virtual"),
                        //     // )
                        //   ],
                        // ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        // ClipOval(
                        //   child: Stack(
                        //     children: [
                        //       SizedBox(
                        //         height: 80,
                        //         width: 80,
                        //         child: Image.asset(
                        //           'assets/images/real/user.jpg',
                        //           fit: BoxFit.cover,
                        //           // scale: 1,
                        //           // height: 50,
                        //           // width: 50,
                        //           // Helper.getAssetName(
                        //           //   "user.jpg",
                        //           //   "real",
                        //           // ),
                        //           // fit: BoxFit.contain,
                        //         ),
                        //       ),
                        //       Positioned(
                        //         bottom: 0,
                        //         child: Container(
                        //           height: 20,
                        //           width: 80,
                        //           color: Colors.black.withOpacity(0.3),
                        //           child: Image.asset(Helper.getAssetName(
                        //               "camera.png", "virtual")),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        const SizedBox(
                          height: 10,
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "مرحبا بك : ${controller.myServices.sharedPreferences.getString('username')}",
                          style:
                              Helper.getTheme(context).headlineMedium?.copyWith(
                                    color: AppColor.primary,
                                  ),
                        ),
                        Text(
                          "رصيدك : ${controller.myServices.sharedPreferences.getInt('user_wallet')} ريال",
                          style:
                              Helper.getTheme(context).headlineMedium?.copyWith(
                                    color: AppColor.primary,
                                  ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const SizedBox(
                          height: 5,
                        ),

                        WidgetRowProfile(
                          text: "المعلومات الشخصية",
                          icon: Icons.person_outline,
                          moveicon: Icons.arrow_forward,
                          color: Colors.pink,
                          onPressed: () => Get.toNamed(AppRoutes.editProfile),
                        ),
                        // WidgetRowProfile(
                        //   text: "الاسم",
                        //   icon: Icons.person_outline,
                        //   moveicon: Icons.arrow_forward,
                        //   color: Colors.pink,
                        //   onPressed: () => Get.toNamed(AppRoutes.changeUserName),
                        // ),

                        WidgetRowProfile(
                          text: "كلمة المرور",
                          icon: Icons.password,
                          moveicon: Icons.arrow_forward,
                          color: Colors.green,
                          onPressed: () =>
                              Get.toNamed(AppRoutes.changePassword),
                        ),
                        // WidgetRowProfile(
                        //   text: "البريد الالكتروني",
                        //   icon: Icons.email,
                        //   moveicon: Icons.arrow_forward,
                        //   color: const Color.fromARGB(255, 239, 83, 80),
                        //   onPressed: () => Get.toNamed(AppRoutes.changeEmail),
                        // ),
                        // WidgetRowProfile(
                        //   text: "رقم الجوال",
                        //   icon: Icons.phone,
                        //   moveicon: Icons.arrow_forward,
                        //   color: Colors.blue,
                        //   onPressed: () => Get.toNamed(AppRoutes.changePhone),
                        // ),
                        // WidgetRowProfile(
                        //   text: "رقم الواتس",
                        //   icon: Icons.phone,
                        //   moveicon: Icons.arrow_forward,
                        //   color: Colors.green,
                        //   onPressed: () => Get.toNamed(AppRoutes.changeWhats),
                        // ),
                        WidgetRowProfile(
                          text: "العناوين",
                          icon: Icons.location_on_outlined,
                          moveicon: Icons.arrow_forward,
                          color: Colors.orange,
                          onPressed: () => Get.toNamed(AppRoutes.addressview),
                        ),
                        WidgetRowProfile(
                          text: "المطور",
                          icon: Icons.developer_mode,
                          moveicon: Icons.arrow_forward,
                          color: Colors.blue,
                          onPressed: () => Get.offAllNamed(AppRoutes.developer),
                        ),
                        //  WidgetRowProfile(
                        //   text: "مشاركة التطبيق",
                        //   icon: Icons.share,
                        //   moveicon: Icons.arrow_forward,
                        //   color: Colors.green,
                        //   onPressed: () => SocialShare.shareOptions(applink),
                        // ),
                        WidgetRowProfile(
                          text: "حذف الحساب",
                          icon: Icons.no_accounts_outlined,
                          moveicon: Icons.arrow_forward,
                          color: Colors.red,
                          onPressed: () =>
                              Get.toNamed(AppRoutes.deleteAccountPage),
                        ),
                        // ProfileInput(
                        //   label: "  رقم الجوال",
                        //   value:
                        //       '${controller.myServices.sharedPreferences.getString('userphone')}',
                        // ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 50,
                          // width: double.infinity,
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.signOut();
                            },
                            child: const Text("تسجيل خروج"),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
