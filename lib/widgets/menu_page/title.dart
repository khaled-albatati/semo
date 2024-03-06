import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/controller/foodmenu_controller.dart';
import 'package:semo/core/constant/color.dart';
import 'package:semo/data/model/foodrestaurants_model.dart';

class TitleMenuPage extends StatefulWidget {
  const TitleMenuPage({super.key});

  @override
  State<TitleMenuPage> createState() => _TitleMenuPageState();
}

class _TitleMenuPageState extends State<TitleMenuPage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    // Simulating async loading process
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    FoodMenuController controller = Get.put(FoodMenuController());
    // return GetBuilder<FoodMenuController>(
    //     builder: (controller) => isLoading
    //         ? LottieBuilder.asset(
    //             AppImageAssets.loading,
    //             // height: 600,
    //           )
    //         : SizedBox(
    return SizedBox(
      height: 80,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
            // width: 10,
            ),
        shrinkWrap: true,
        itemCount: controller.mealType.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return TitleMenuPageList(
            i: index,
            foodRestaurantsModel:
                FoodRestaurantsModel.fromJson(controller.foodMenu[index]),
          );
        },
      ),
    );
  }
}

class TitleMenuPageList extends GetView<FoodMenuController> {
  final FoodRestaurantsModel foodRestaurantsModel;
  final int? i;
  const TitleMenuPageList(
      {super.key, required this.foodRestaurantsModel, this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCat(i!, foodRestaurantsModel.foodKind!);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 20, 0),
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          GetBuilder<FoodMenuController>(
            builder: (controller) {
              return Container(
                decoration: controller.selectedCat == i
                    ? const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 2, color: AppColor.primarycolor),
                        ),
                      )
                    : null,
                child: Text(
                  '${foodRestaurantsModel.foodKind}',
                  style: const TextStyle(
                      color: AppColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              );
            },
          )
        ]),
      ),
    );
  }
}
