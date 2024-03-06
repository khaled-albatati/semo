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

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor:
          Colors.transparent, // Set navigation bar color to transparent
      statusBarColor: Colors.transparent, // Set status bar color to transparent
    ));

    return Scaffold(
        appBar: AppBar(
          title: const Text('المطاعم'),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white, // Set the background color of the window
          ),
          child: GetBuilder<RestaurantNavBarController>(
            builder: (controller) => HandlingDataView(
              statusRequiest: controller.statusRequiest,
              widget: GridView.builder(
                itemCount: controller.family.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Display 2 items in each row
                  childAspectRatio: 3 / 4, // Square shape for each item
                  crossAxisSpacing: 1, // Spacing between items horizontally
                  mainAxisSpacing: 0, // Spacing between items vertically
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
                              blurStyle: BlurStyle.solid)
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: RestaurantsNavBar(
                        foodRestaurantsModel: FoodRestaurantsModel.fromJson(
                            controller.family[index]),
                        i: index,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}

class RestaurantsNavBar extends GetView<RestaurantNavBarController> {
  final FoodRestaurantsModel foodRestaurantsModel;
  final int? i;
  // final String mealType;
  const RestaurantsNavBar({
    super.key,
    required this.foodRestaurantsModel,
    this.i,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => controller.goToMenu(
          controller.family,
          foodRestaurantsModel.restaurantsId,
          foodRestaurantsModel.restaurantsName,
          foodRestaurantsModel),
      child: Column(
        mainAxisSize: MainAxisSize.max,
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
                imageUrl:
                    "${AppLink.restaurantImage}/${foodRestaurantsModel.restaurantsImg}",
                placeholder: (context, url) =>
                    Lottie.asset('assets/images/lottile/loadin_data.json'),
                errorWidget: (context, url, error) =>
                    Image.asset('assets/images/nofood.png'),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
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
                    Text('${foodRestaurantsModel.restaurantsName}',
                        style: const TextStyle(
                            color: AppColor.orange,
                            fontWeight: FontWeight.bold)),
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
