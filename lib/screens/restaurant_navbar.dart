import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:semo/const/colors.dart';
import 'package:semo/core/class/handling_dataview.dart';
import '../controller/restaurant_navbarcontroller.dart';
import '../data/model/foodrestaurants_model.dart';
import '../linkapi.dart';

class RestaurantNav extends StatefulWidget {
  const RestaurantNav({Key? key}) : super(key: key);

  @override
  State<RestaurantNav> createState() => _RestaurantNavState();
}

class _RestaurantNavState extends State<RestaurantNav> {
  @override
  void initState() {
    Get.put(RestaurantNavBarController());
    super.initState();
  }

  RestaurantNavBarController controller = Get.put(RestaurantNavBarController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ));

    return Scaffold(
      appBar: AppBar(
        title: const Text('المطاعم'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: GetBuilder<RestaurantNavBarController>(
          builder: (controller) => HandlingDataView(
            statusRequiest: controller.statusRequiest,
            widget: controller.family.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                        child: Text(
                          "لاتوجد مطاعم الان",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          controller.getRestaurants();
                        },
                        child: const Text("إعادة تحميل"),
                      ),
                    ],
                  )
                : GridView.builder(
                    itemCount: controller.family.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 4,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(7, 10, 7, 18),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x32000000),
                                offset: Offset(0, 2),
                                blurStyle: BlurStyle.solid,
                              )
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: RestaurantsNavBar(
                            foodRestaurantsModel: FoodRestaurantsModel.fromJson(controller.family[index]),
                            i: index,
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}

class RestaurantsNavBar extends GetView<RestaurantNavBarController> {
  final FoodRestaurantsModel foodRestaurantsModel;
  final int? i;

  const RestaurantsNavBar({
    super.key,
    required this.foodRestaurantsModel,
    this.i,
  });

  @override
  Widget build(BuildContext context) {
    final isOpen = foodRestaurantsModel.isOpen(); // Check if the restaurant is open

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: isOpen
          ? () => controller.goToMenu(
                controller.family,
                foodRestaurantsModel.restaurantsId,
                foodRestaurantsModel.restaurantsName,
                foodRestaurantsModel,
              )
          : () => Get.snackbar('المطعم مغلق', 'لا يمكنك الدخول للمطعم المغلق'), // Show a message if closed
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: SizedBox(
                  height: 150,
                  child: CachedNetworkImage(
                    imageUrl: "${AppLink.restaurantImage}/${foodRestaurantsModel.restaurantsImg}",
                    placeholder: (context, url) => Lottie.asset('assets/images/lottile/loadin_data.json'),
                    errorWidget: (context, url, error) => Image.asset('assets/images/nofood.png'),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Closed Badge
              if (!isOpen)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    color: Colors.red,
                    child: const Text(
                      "مغلق",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      '${foodRestaurantsModel.restaurantsName}',
                      style: const TextStyle(
                        color: AppColor.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}