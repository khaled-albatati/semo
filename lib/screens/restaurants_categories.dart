import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/controller/restaurantcategories_controller.dart';
import 'package:semo/widgets/restaurants_categories/restaurantscategories_list.dart';

import '../utils/helper.dart';

class RestaurantsCategories extends GetView<RestaurantCategoriesController> {
  const RestaurantsCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("المطاعم"), centerTitle: true),
      body: Container(height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      image: DecorationImage(fit: BoxFit.cover,
                          image: AssetImage(
                    Helper.getAssetName("splashIcon.png", "virtual"),
                  ))),child: const RestaurantsCategoriesList()),
            
    );
  }
}
