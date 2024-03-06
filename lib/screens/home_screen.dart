import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/const/colors.dart';
import 'package:semo/controller/test_controller.dart';
import '../core/class/handling_dataview.dart';
import '../core/constant/routes.dart';
import '../utils/helper.dart';
import '../widgets/home_screen/home_categorycard.dart';
import '../widgets/home_screen/home_mostpopular.dart';
import '../widgets/home_screen/home_lastfood.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Get.put(AllController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 6, 0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.offAllNamed(AppRoutes.orderspending);
                },
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.history_toggle_off_sharp,
                      size: 25,
                    ),
                    Text('الطلبات', style: TextStyle(fontSize: 14)),
                  ],
                ),
              )
            ],
          ),
        ),
        title: const Text('الرئيسية'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(6, 5, 0, 0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.offAllNamed(AppRoutes.trackWsl);
                  },
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.wallet_giftcard_sharp,
                        size: 25,
                      ),
                      Text('مرسال', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: GetBuilder<AllController>(
        builder: (controller) => controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : HandlingDataView(
                statusRequiest: controller.statusRequiest,
                widget: Stack(
                  children: [
                    SafeArea(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    HomeCategories(),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                              decoration: BoxDecoration(boxShadow: const [
                                BoxShadow(
                                  color: AppColor.orange,
                                ),
                              ], borderRadius: BorderRadius.circular(10)),
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    " المطاعم ",
                                    style: Helper.getTheme(context)
                                        .headlineSmall
                                        ?.copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 250,
                              width: double.infinity,
                              padding: const EdgeInsets.only(left: 20),
                              child: const SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [MostPopularCard()],
                                ),
                              ),
                            ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                              decoration: BoxDecoration(boxShadow: const [
                                BoxShadow(
                                  color: AppColor.orange,
                                ),
                              ], borderRadius: BorderRadius.circular(10)),
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "اجدد الوجبات",
                                    style: Helper.getTheme(context)
                                        .headlineSmall
                                        ?.copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Column(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        // Navigator.of(context)
                                        //     .pushNamed(IndividualItem.routeName);
                                      },
                                      child: const RecentItemCard()),
                                  const SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
