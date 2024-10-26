import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:semo/controller/test_controller.dart';
import 'package:semo/data/model/foodrestaurants_model.dart';
import '../../const/colors.dart';
import '../../linkapi.dart';
import '../../utils/helper.dart';

class MostPopularCard extends GetView<AllController> {
  const MostPopularCard({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AllController());

    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: controller.restaurantHome.length,
      itemBuilder: (context, index) {
        return SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(left: 30),
          child: MostPopularCardView(
              // i: index,
              foodRestaurantsModel: FoodRestaurantsModel.fromJson(
                  controller.restaurantHome[index])),
        );
      },
    );
  }
}

class MostPopularCardView extends GetView<AllController> {
  final FoodRestaurantsModel foodRestaurantsModel;

  const MostPopularCardView({
    super.key,
    required this.foodRestaurantsModel,
  });

  @override
  Widget build(BuildContext context) {
    final isOpen = foodRestaurantsModel.isOpen();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            InkWell(
              onTap: isOpen
                  ? () => controller.goToMenu(
                      controller.restaurantHome,
                      foodRestaurantsModel.restaurantsId,
                      foodRestaurantsModel.restaurantsName,
                      foodRestaurantsModel,
                      foodRestaurantsModel.restaurantsLocation)
                  :()=>Get.snackbar('المطعم مغلق','') , // Disable tap if closed
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: SizedBox(
                  width: 260,
                  height: 160,
                  child: CachedNetworkImage(
                    imageUrl:
                        "${AppLink.restaurantImage}/${foodRestaurantsModel.restaurantsImg}",
                    placeholder: (context, url) => Lottie.asset('assets/images/lottile/loadin_data.json'),
                    errorWidget: (context, url, error) => Image.asset('assets/images/nofood.png'),
                    height: 160,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            if (!isOpen)
              Positioned(
                top: 10,
                right: 10,
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
        const SizedBox(height: 10),
        Text(
          '${foodRestaurantsModel.restaurantsName}',
          style: Helper.getTheme(context)
              .headlineMedium
              ?.copyWith(color: AppColor.primary),
        ),
        Row(
          children: [
            Text('${foodRestaurantsModel.restaurantsCategoriesName}'),
            const SizedBox(width: 5),
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
            const SizedBox(width: 5),
            Text('${foodRestaurantsModel.restaurantsName}'),
            const SizedBox(width: 20),
            Image.asset(
              Helper.getAssetName("star_filled.png", "virtual"),
            ),
            const SizedBox(width: 5),
          ],
        )
      ],
    );
  }
}