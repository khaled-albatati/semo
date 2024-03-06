// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:semo/const/colors.dart';
// import 'package:semo/controller/auth/profile_controller.dart';
// import 'package:semo/utils/helper.dart';
// import '../widgets/profile/profile_input.dart';

// class Profile1 extends GetView<ProfileControllerImp> {
//   const Profile1({super.key});

//   // static const routeName = "/profileScreen";
//   @override
//   Widget build(BuildContext context) {
//     final email = controller.myServices.sharedPreferences.getString('email');
 
//     Get.put(ProfileControllerImp());
//     return Scaffold(
//       body: Stack(
//         children: [
//           SafeArea(
//             child: SizedBox(
//               // height: Helper.getScreenHeight(context),
              
//               width: Helper.getScreenWidth(context),
//               child: SingleChildScrollView(
//                 child: 
//                 // Padding(
//                 //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 //   child:
//                    Column(
//                     children: [
//                       // Row(
//                       //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       //   children: [
//                       //     Text(
//                       //       "Profile",
//                       //       style: Helper.getTheme(context).headline5,
//                       //     ),
//                       //     Image.asset(
//                       //       Helper.getAssetName("cart.png", "virtual"),
//                       //     )
//                       //   ],
//                       // ),
//                       Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/real/hamburger3.jpg'),fit: BoxFit.cover)),
//                         child: Column(children: [
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         ClipOval(
//                           child: Stack(
//                             children: [
//                               SizedBox(
//                                 height: 80,
//                                 width: 80,
//                                 child: Image.asset(
//                                   'assets/images/real/user.jpg',
//                                   fit: BoxFit.cover,
//                                   // scale: 1,
//                                   // height: 50,
//                                   // width: 50,
//                                   // Helper.getAssetName(
//                                   //   "user.jpg",
//                                   //   "real",
//                                   // ),
//                                   // fit: BoxFit.contain,
//                                 ),
//                               ),
//                               Positioned(
//                                 bottom: 0,
//                                 child: Container(
//                                   height: 20,
//                                   width: 80,
//                                   color: Colors.black.withOpacity(0.3),
//                                   child: Image.asset(Helper.getAssetName(
//                                       "camera.png", "virtual")),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Image.asset(
//                               Helper.getAssetName("edit_filled.png", "virtual"),
//                             ),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             const Text(
//                               "تعديل الحساب",
//                               style: TextStyle(color: AppColor.orange),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           "مرحبا بك : ${controller.myServices.sharedPreferences.getString('username')}",
//                           style: Helper.getTheme(context).headline4?.copyWith(
//                                 color: AppColor.primary,
//                               ),
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         const SizedBox(
//                           height: 40,
//                         ),]),
//                       ),
//                        ProfileInput(
//                         label: "الاسم",
//                         value: '${controller.myServices.sharedPreferences.getString('username')}',
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                        ProfileInput(
//                         label: "البريد الالكتروني",
//                         value:'${controller.myServices.sharedPreferences.getString('email')}',
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                        ProfileInput(
//                         label: "رقم الجوال",
//                         value: '${controller.myServices.sharedPreferences.getString('phone')}',
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
                     
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       SizedBox(
//                         height: 50,
//                         width: 200,
//                         child: ElevatedButton(
//                           onPressed: () {},
//                           child: const Text("حفظ"),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       SizedBox(
//                         height: 50,
//                         // width: double.infinity,
//                         width: 200,
//                         child: ElevatedButton(
//                           onPressed: () {},
//                           child: const Text("تسجيل خروج"),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
