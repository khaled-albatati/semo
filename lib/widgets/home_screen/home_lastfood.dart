import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:semo/controller/test_controller.dart';
import 'package:semo/data/model/foodrestaurants_model.dart';
import '../../const/colors.dart';
import '../../linkapi.dart';
import '../../utils/helper.dart';

class RecentItemCard extends GetView<AllController> {
  const RecentItemCard({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AllController());

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: controller.foodLast.length,
      itemBuilder: (context, index) {
        return SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: RecentItemCardView(
              i: index,
              foodRestaurantsModel:
                  FoodRestaurantsModel.fromJson(controller.foodLast[index])),
        );
      },
    );
  }
}

class RecentItemCardView extends GetView<AllController> {
  final FoodRestaurantsModel foodRestaurantsModel;
  final int? i;
  const RecentItemCardView({
    super.key,
    required this.foodRestaurantsModel,
    this.i,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToMenu(
            controller.foodLast,
            foodRestaurantsModel.restaurantsId,
            foodRestaurantsModel.restaurantsName,
            foodRestaurantsModel);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 5, 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                width: 100,
                height: 100,
                child: CachedNetworkImage(
                  imageUrl:
                      "${AppLink.foodImage}/${foodRestaurantsModel.foodImage}",
                  placeholder: (context, url) =>
                      Lottie.asset('assets/images/lottile/loadin_data.json'),
                  errorWidget: (context, url, error) =>
                      Image.asset('assets/images/nofood.png'),
                  // width: 120,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: SizedBox(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${foodRestaurantsModel.foodName}',
                      style: Helper.getTheme(context)
                          .bodyLarge
                          ?.copyWith(color: AppColor.primary),
                    ),
                    Row(
                      children: [
                        Text('${foodRestaurantsModel.restaurantsName}'),
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
                        Text('${foodRestaurantsModel.foodPrice} ريال'),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
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
                          "${foodRestaurantsModel.foodKind}",
                          style: const TextStyle(
                            color: AppColor.orange,
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
