import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:semo/controller/test_controller.dart';
import 'package:semo/data/model/categoriesmodel.dart';
// import 'package:semo/data/model/restaurantmodel.dart';
import 'package:semo/linkapi.dart';
import '../../const/colors.dart';
import '../../utils/helper.dart';

//categories line

class HomeCategories extends GetView<AllController> {
  const HomeCategories({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AllController());

    return SizedBox(
      // width: 1000,
      height: 110,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: CategoryCard(
                i: index,
                categoriesModel:
                    CategoriesModel.fromJson(controller.categories[index])),
          );
        },
      ),
    );
  }
}

class CategoryCard extends GetView<AllController> {
  final CategoriesModel categoriesModel;
  final int? i;

  const CategoryCard(
      {super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToCategories(
            controller.categories, categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: 140,
              height: 80,
              child: CachedNetworkImage(
                imageUrl:
                    "${AppLink.categoriesImage}/${categoriesModel.categoriesImage}",
                placeholder: (context, url) =>
                    Lottie.asset('assets/images/lottile/loadin_data.json'),
                errorWidget: (context, url, error) =>
                    Image.asset('assets/images/nofood.png'),
                width: 120,
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            '${categoriesModel.categoriesName}',
            style: Helper.getTheme(context)
                .headlineMedium
                ?.copyWith(color: AppColor.primary, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
