import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:semo/const/colors.dart';
import 'package:semo/core/constant/imageassets.dart';
import 'package:semo/screens/menu.dart';
import '../controller/foodmenu_controller.dart';
import '../core/class/handling_dataview.dart';
import '../data/model/foodrestaurants_model.dart';
import '../widgets/menu_page/title.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});
  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    // Simulating async loading process
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    FoodMenuController controller = Get.put(FoodMenuController());

    return Scaffold(
        appBar: AppBar(title: const Text("القائمة"),centerTitle: true),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                controller.goToCheckOut();
              },
              child: const Text('اتمام الطلب'),
            )
          ],
        ),
        body: WillPopScope(
            child: Container(
              color: Colors.white,
              child: SafeArea(
                child: GetBuilder<FoodMenuController>(
                    builder: (controller) => isLoading
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LottieBuilder.asset(AppImageAssets.loading),
                            ],
                          )
                        : ListView(children: [
                            const TitleMenuPage(),
                            GetBuilder<FoodMenuController>(
                              builder: (controller) =>
                                   HandlingDataView(
                                    statusRequiest: controller.statusRequiest,
                                    widget:
                                  ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: controller.categoriesmenu.length,
                                itemBuilder: (context, index) {
                                  return SingleChildScrollView(
                                    padding: const EdgeInsets.only(bottom: 6),
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    child: FoodMenu(
                                        i: index,
                                        mealType:
                                            controller.categories.toString(),
                                        foodRestaurantsModel:
                                            FoodRestaurantsModel.fromJson(
                                                controller
                                                    .categoriesmenu[index])),
                                  );
                                },
                              ),
                            ),
                            ),
                          ])),
              ),
            ),
            onWillPop: () {
              Get.defaultDialog(
                  title: "ملاحظة",
                  middleText: "سيتم حذف الطلبات الحالية عند الرجوع",
                  textCancel: "الرجوع",
                  cancelTextColor: AppColor.firstColor,
                  textConfirm: "موافق",
                  confirmTextColor: Colors.white,
                  buttonColor: AppColor.orange,
                  onCancel: () {},
                  onConfirm: () {
                    controller.onBack();
                    Get.back();
                  });
              return Future.value(false);
            }
            ));
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:semo/const/colors.dart';
// import 'package:semo/controller/foodmenu_controller.dart';
// import 'package:semo/data/model/foodModel.dart';
// import 'package:semo/screens/menu.dart';

// class MenuPage extends StatelessWidget {
//   const MenuPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     FoodMenuController controller = Get.put(FoodMenuController());

//     return Scaffold(
//       body: SafeArea(
//         child: GetBuilder<FoodMenuController>(
//           builder: (controller) {
//             return DefaultTabController(
//               length: controller.foodMenu.length,
//               child: Column(
//                 children: [
//                   TabBar(
//                     indicatorColor: AppColor.black,
//                     labelColor: AppColor.black,
//                     // tabs: _buildTabs(controller.foodMenu),
//                     tabs: [Tab(child: Text('1'),),Tab(child: Text('data'),)]
//                   ),
//                   const Expanded(
//                     child: TabBarView(
//                       children: [
//                        Text('1'),
//                         Text('222'),

//                       ],
//                       // children: _buildTabViews(controller.foodMenu),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   // List<Widget> _buildTabs(List<dynamic> foodMenu) {
//   //   return foodMenu.map((item) {
//   //     return Tab(
//   //       text: item['mealType'],
//   //     );
//   //   }).toList();
//   // }

//   // List<Widget> _buildTabViews(List<dynamic> foodMenu) {
//   //   return foodMenu.map((item) {
//   //     return Menu(
//   //       mealType: item['mealType'],
//   //     );
//   //   }).toList();
//   // }
//   List<Widget> _buildTabs(List<FoodModel> foodMenu) {
//   return foodMenu.map((item) {
//     return Tab(
//       child: Text(item.foodId!),
//     );
//   }).toList();
// }

// List<Widget> _buildTabViews(List<FoodModel> foodMenu) {
//   return foodMenu.map((item) {
//     return Menu(mealType: item.foodRestaurantId!);
//   }).toList();
// }
// }
