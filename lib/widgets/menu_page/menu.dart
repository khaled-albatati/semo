import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../const/colors.dart';
import '../../controller/foodmenu_controller.dart';
import '../../data/model/foodrestaurants_model.dart';
import '../../linkapi.dart';
import '../menu/priceand_count.dart';

class FoodMenu extends StatefulWidget {
  final FoodRestaurantsModel foodRestaurantsModel;
  final String mealType;
  final Function(int) onUpdate; // Add callback for total items
  final Function(int) onQuantityChange; // Add callback for individual quantity
  final int initialQuantity; // Add initial quantity

  const FoodMenu({
    super.key,
    required this.foodRestaurantsModel,
    required this.mealType,
    required this.onUpdate,
    required this.onQuantityChange,
    required this.initialQuantity,
  });

  @override
  _FoodMenuState createState() => _FoodMenuState();
}

class _FoodMenuState extends State<FoodMenu> {
  FoodMenuController controller = Get.find();
  late int countItems;

  @override
  void initState() {
    super.initState();
    countItems = widget.initialQuantity; // Use initial quantity from parent widget
  }

  void incrementCountItems() {
    setState(() {
      countItems++;
      widget.onUpdate(1); // Update total items
      widget.onQuantityChange(countItems); // Update individual item quantity
    });
  }

  void decrementCountItems() {
    if (countItems > 0) {
      setState(() {
        countItems--;
        widget.onUpdate(-1); // Update total items
        widget.onQuantityChange(countItems); // Update individual item quantity
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.96,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            color: Color(0x33000000),
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
              child: SizedBox(
                width: double.infinity,
                height: 100,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 18, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(5, 2, 2, 2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: CachedNetworkImage(
                              imageUrl: "${AppLink.foodImage}/${widget.foodRestaurantsModel.foodImage}",
                              placeholder: (context, url) => Lottie.asset('assets/images/lottile/loadin_data.json'),
                              errorWidget: (context, url, error) => Image.asset('assets/images/nofood.png'),
                              width: 90,
                              height: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${widget.foodRestaurantsModel.foodName}",
                            ),
                            Text(
                              '${widget.foodRestaurantsModel.foodPrice} ريال',
                              style: const TextStyle(color: AppColor.orange),
                            ),
                          ],
                        ),
                      ),
                      PriceAndCountItems(
                        onAdd: () {
                          controller.additems(widget.foodRestaurantsModel.foodId!.toString());
                          incrementCountItems();
                        },
                        onRemove: () {
                          controller.deleteitems(widget.foodRestaurantsModel.foodId!.toString());
                          decrementCountItems();
                        },
                        count: countItems.toString(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 1),
          ],
        ),
      ),
    );
  }
}

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
// import 'package:semo/const/colors.dart';
// import 'package:semo/controller/foodmenu_controller.dart';
// import 'package:semo/widgets/menu/priceand_count.dart';
// import '../data/model/foodrestaurants_model.dart';
// import '../linkapi.dart';

// class Menu extends GetView<FoodMenuController> {
//   // final String mealType;
//   const Menu({super.key});
//   @override
//   Widget build(BuildContext context) {
//     controller.mealType;
//     Get.put(FoodMenuController());
//     return const Scaffold();
//   }
// }

// class FoodMenu extends StatefulWidget {
//   final FoodRestaurantsModel foodRestaurantsModel;
//   final int? i;
//   final String mealType;
//   const FoodMenu(
//       {super.key,
//       required this.foodRestaurantsModel,
//       required this.mealType,
//       this.i});

//   @override
//   State<FoodMenu> createState() => _FoodMenuState();
// }

// class _FoodMenuState extends State<FoodMenu> {
//   FoodMenuController controller = Get.put(FoodMenuController());
//   late int countItems;

//   @override
//   void initState() {
//     super.initState();
//     countItems = int.parse('${widget.foodRestaurantsModel.countitems}');
//     // controller.changeCat(0,'?');
//   }

//   void incrementCountItems() {
//     setState(() {
//       countItems++;
//     });
//   }

// // Usage
//   // int x =controller.countitems;
//   @override
//   Widget build(BuildContext context) {
//     return // Generated code for this Container Widget...
//         Container(
//       width: MediaQuery.sizeOf(context).width * 0.96,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: const [
//           BoxShadow(
//             blurRadius: 4,
//             color: Color(0x33000000),
//             offset: Offset(0, 2),
//           )
//         ],
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: SafeArea(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
//               child: SizedBox(
//                 width: double.infinity,
//                 height: 100,
//                 child: Padding(
//                   padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 18, 8),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Container(
//                         width: 90,
//                         height: 90,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: Padding(
//                           padding:
//                               const EdgeInsetsDirectional.fromSTEB(5, 2, 2, 2),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(6),
//                             child: CachedNetworkImage(
//                               imageUrl:
//                                   "${AppLink.foodImage}/${widget.foodRestaurantsModel.foodImage}",
//                               placeholder: (context, url) => Lottie.asset(
//                                   'assets/images/lottile/loadin_data.json'),
//                               errorWidget: (context, url, error) =>
//                                   Image.asset('assets/images/nofood.png'),
//                               width: 90,
//                               height: 90,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Column(
//                           mainAxisSize: MainAxisSize.max,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Text(
//                               "${widget.foodRestaurantsModel.foodName}",
//                             ),
//                             Text(
//                               '${widget.foodRestaurantsModel.foodPrice} ريال',
//                               style: const TextStyle(color: AppColor.orange),
//                             ),
//                           ],
//                         ),
//                       ),
//                       PriceAndCountItems(
//                           onAdd: () {
//                             controller
//                                 .additems(widget.foodRestaurantsModel.foodId!.toString());
//                             setState(() {
//                               countItems++;
//                             });
//                           },
//                           onRemove: () {
//                             controller.deleteitems(
//                                 widget.foodRestaurantsModel.foodId!.toString());
//                                  setState(() {
//                               countItems--;
//                             });
//                           },
//                           // price: '${widget.foodRestaurantsModel.foodPrice}',
//                           count: countItems.toString())
//                       // Text(
//                       //   '${foodRestaurantsModel.foodPrice}',
//                       //   textAlign: TextAlign.end,
//                       // ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 1,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
