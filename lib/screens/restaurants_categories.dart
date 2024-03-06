import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/controller/restaurantcategories_controller.dart';
import 'package:semo/widgets/restaurants_categories/restaurantscategories_list.dart';

class RestaurantsCategories extends GetView<RestaurantCategoriesController> {
  const RestaurantsCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("المطاعم"), centerTitle: true),
      body: const SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            RestaurantsCategoriesList(),
          ],
        ),
      )),
    );
  }
}
