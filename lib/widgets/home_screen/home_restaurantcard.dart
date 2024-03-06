import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:semo/controller/home/restaurant_controller.dart';
import 'package:semo/data/model/restaurantmodel.dart';
import '../../const/colors.dart';
import '../../controller/home/restaurantshome_controller.dart';
import '../../data/model/foodrestaurants_model.dart';
import '../../linkapi.dart';
import '../../utils/helper.dart';

//second part

class RestaurantCard extends GetView<RestaurantHomeController> {
  const RestaurantCard({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(RestaurantHomeController());

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: controller.restaurantHome.length > 2
          ? 2
          : controller.restaurantHome.length,
      itemBuilder: (context, index) {
        return RestaurantCardView(
            i: index,
            foodRestaurantsModel:
                FoodRestaurantsModel.fromJson(controller.restaurantHome[index]),
            restaurantModel:
                RestaurantModel.fromJson(controller.restaurantHome[index]));
      },
    );
  }
}

class RestaurantCardView extends StatelessWidget {
  final RestaurantModel restaurantModel;
  final FoodRestaurantsModel foodRestaurantsModel;

  final int? i;
  const RestaurantCardView({
    super.key,
    required this.restaurantModel,
    this.i,
    required this.foodRestaurantsModel,
  });

//image size for restaurants : 350*200
  @override
  Widget build(BuildContext context) {
    RestaurantsHomeController controller = Get.put(RestaurantsHomeController());

    return InkWell(
      onTap: () => controller.goToMenu(
          controller.restaurant,
          restaurantModel.restaurantsId,
          restaurantModel.restaurantsName,
          foodRestaurantsModel),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl:
                    "${AppLink.restaurantImage}/${restaurantModel.restaurantsImg}",
                placeholder: (context, url) =>
                    Lottie.asset('assets/images/lottile/loadin_data.json'),
                errorWidget: (context, url, error) =>
                    Image.asset('assets/images/nofood.png'),
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      '${restaurantModel.restaurantsName}',
                      style: Helper.getTheme(context).displaySmall,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Image.asset(
                      Helper.getAssetName("star_filled.png", "virtual"),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${restaurantModel.restaurantsLocation}',
                      style: const TextStyle(
                        color: AppColor.orange,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    // const Text("(124 ratings)"),
                    const SizedBox(
                      width: 5,
                    ),
                    Text('${restaurantModel.restaurantsCategoriesName}'),
                    const SizedBox(
                      width: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        ".",
                        style: TextStyle(
                          color: AppColor.orange,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text("${restaurantModel.restaurantKind}"),
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


//black design

// return SizedBox(
//       height: 250,
//       width: double.infinity,
//       child: Stack(
//         children: [
//           SizedBox(
//             height: 250,
//             width: double.infinity,
//             child: CachedNetworkImage(imageUrl: "${AppLink.restaurantImage}/${restaurantModel.restaurantsImg}",),
//           ),
//           Container(
//             height: 250,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.bottomCenter,
//                 end: Alignment.topCenter,
//                 colors: [
//                   Colors.black.withOpacity(0.7),
//                   Colors.black.withOpacity(0.2),
//                 ],
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomLeft,
//             child: Container(
//               height: 70,
//               width: double.infinity,
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "${restaurantModel.restaurantsName}",
//                     style: Helper.getTheme(context).headline4?.copyWith(
//                           color: Colors.white,
//                         ),
//                   ),
//                   Row(
//                     children: [
//                       Image.asset(
//                         Helper.getAssetName("star_filled.png", "virtual"),
//                       ),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       Text(
//                         "${restaurantModel.restaurantsName}",
//                         style: const TextStyle(color: AppColor.orange),
//                       ),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       Text(
//                        "${restaurantModel.restaurantsName}",
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.only(bottom: 8.0),
//                         child: Text(
//                           ".",
//                           style: TextStyle(color: AppColor.orange),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       const Text(
//                         "Desserts",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
