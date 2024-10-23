import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/restaurantcategories_controller.dart';
import '../../data/model/foodrestaurants_model.dart';
import '../../data/model/restaurantmodel.dart';
import '../../linkapi.dart';

class RestaurantsCategoriesList
    extends GetView<RestaurantCategoriesController> {
  const RestaurantsCategoriesList({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(RestaurantCategoriesController());

    return GetBuilder<RestaurantCategoriesController>(
        builder: (controller) => controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: controller.restaurant.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: RestaurantsCategoriesListView(
                        i: index,
                        foodRestaurantsModel: FoodRestaurantsModel.fromJson(
                            controller.restaurant[index]),
                        restaurantModel: RestaurantsModel.fromJson(
                            controller.restaurant[index])),
                  );
                },
              ));
    // },
    // );
  }
}

class RestaurantsCategoriesListView
    extends GetView<RestaurantCategoriesController> {
  final RestaurantsModel restaurantModel;
  final FoodRestaurantsModel foodRestaurantsModel;
  final int? i;
  const RestaurantsCategoriesListView(
      {super.key,
      required this.restaurantModel,
      this.i,
      required this.foodRestaurantsModel});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
            child: Container(
              width: double.infinity,
              height: 90,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                child: InkWell(
                  onTap: () {
                    controller.goToMenu(
                        controller.restaurant,
                        restaurantModel.restaurantsId,
                        restaurantModel.restaurantsName,
                        foodRestaurantsModel);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          // color: const Color(0x4C4B39EF),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "${AppLink.restaurantImage}/${restaurantModel.restaurantsImg}",
                              width: 90,
                              height: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${restaurantModel.restaurantsName}",
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 0, 0),
                                  child: Text(
                                    "${restaurantModel.restaurantsCity}",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 1,
          )
        ],
      ),
    );
  }
}
