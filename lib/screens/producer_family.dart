import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:semo/controller/familyproducer_controller.dart';
import '../const/colors.dart';
import '../core/class/handling_dataview.dart';
import '../data/model/foodrestaurants_model.dart';
import '../linkapi.dart';

class ProducerFamily extends StatefulWidget {
  const ProducerFamily({Key? key}) : super(key: key);

  @override
  State<ProducerFamily> createState() => _ProducerFamilyState();
}

class _ProducerFamilyState extends State<ProducerFamily> {
  final FamilyProducerController controller = Get.put(FamilyProducerController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Set the system UI overlay style
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent, // Set navigation bar color to transparent
      statusBarColor: Colors.transparent, // Set status bar color to transparent
    ));

    return Scaffold(
      appBar: AppBar(
        title: const Text("الاسر المنتجة"),
        centerTitle: true,
      ),
      body: GetBuilder<FamilyProducerController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequiest: controller.statusRequiest,
            widget: controller.family.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                        child: Text(
                      "لاتوجد اسر منتجة الان",
                      style: TextStyle(fontSize: 24),
                     ),
                      ),
                      const SizedBox(height: 20), // Spacing
                      ElevatedButton(
                        onPressed: () {
                          controller.getFamily(); // Call the method to reload data
                        },
                        child: const Text("إعادة تحميل"),
                      ),
                    ],
                  )
                : GridView.builder(
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
                                blurStyle: BlurStyle.solid,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Family(
                            foodRestaurantsModel: FoodRestaurantsModel.fromJson(
                                controller.family[index]),
                            i: index,
                          ),
                        ),
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}

class Family extends GetView<FamilyProducerController> {
  final FoodRestaurantsModel foodRestaurantsModel;
  final int? i;

  const Family({
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
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.restaurantImage}/${foodRestaurantsModel.restaurantsImg}",
                  placeholder: (context, url) => Lottie.asset('assets/images/lottile/loadin_data.json'),
                  errorWidget: (context, url, error) => Image.asset('assets/images/nofood.png'),
                  width: double.infinity,
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