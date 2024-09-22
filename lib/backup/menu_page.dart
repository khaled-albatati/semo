// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:semo/controller/foodmenu_controller.dart';
// import '../data/model/foodrestaurants_model.dart';
// import 'menu.dart';

// class MenuPage extends StatefulWidget {
//   const MenuPage({super.key});

//   @override
//   _MenuPageState createState() => _MenuPageState();
// }

// class _MenuPageState extends State<MenuPage> with SingleTickerProviderStateMixin {
// FoodMenuController controller = Get.put(FoodMenuController());

//   @override
//   void initState() {
//     super.initState();
//     controller.food = Get.put(FoodMenuController());
//     controller.food.menu().then((_) {
//       setState(() {
//         controller.foodMenuMap = _transformFoodMenu(controller.food.foodMenu);
//         controller.tabController = TabController(
//           length: controller.foodMenuMap.keys.length,
//           vsync: this,
//         );
//       });
//     });
//   }
 


//   Map<String, List<Map<String, dynamic>>> _transformFoodMenu(List<dynamic> foodMenuList) {
//     final Map<String, List<Map<String, dynamic>>> map = {};
//     for (var item in foodMenuList) {
//       if (item is Map<String, dynamic>) {
//         String category = item['category'] as String;
//         List<dynamic> items = item['items'] as List<dynamic>;
//         List<Map<String, dynamic>> itemsList = items.whereType<Map<String, dynamic>>().map((e) => e).toList();
//         if (map.containsKey(category)) {
//           map[category]!.addAll(itemsList);
//         } else {
//           map[category] = itemsList;
//         }
//       }
//     }
//     return map;
//   }

//   void updateTotalItems(String foodId, int count) {
//     setState(() {
//       if (controller.itemQuantities.containsKey(foodId)) {
//         controller.itemQuantities[foodId] = (controller.itemQuantities[foodId]! + count).clamp(0, double.infinity).toInt();
//       } else {
//         controller.itemQuantities[foodId] = count;
//       }

//       controller.totalItems = controller.itemQuantities.values.reduce((a, b) => a + b);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("القائمة"),
//         centerTitle: true,
//         bottom: controller.foodMenuMap.isNotEmpty
//             ? TabBar(
//                 controller: controller.tabController,
//                 isScrollable: true,
//                 tabs: controller.foodMenuMap.keys.map((category) => Tab(text: category)).toList(),
//               )
//             : null,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: controller.foodMenuMap.isNotEmpty
//                 ? TabBarView(
//                     controller: controller.tabController,
//                     children: controller.foodMenuMap.entries.map((entry) {
//                       return ListView.builder(
//                         itemCount: entry.value.length,
//                         itemBuilder: (context, index) {
//                           var item = entry.value[index];
//                           String foodId = item['food_id'].toString(); // Ensure food_id is a string
//                           int initialQuantity = controller.itemDetails[foodId]?['quantity'] ?? 0; // Get initial quantity

//                           return FoodMenu(
//                             foodRestaurantsModel: FoodRestaurantsModel.fromJson(item),
//                             mealType: entry.key,
//                             onUpdate: (count) {
//                               updateTotalItems(foodId, count);
//                             },
//                             onQuantityChange: (quantity) {
//                               controller.itemDetails[foodId] = {
//                                 'name': item['food_name'], // Assuming food_name is in the item
//                                 'quantity': quantity,
//                               }; // Update the item details
//                             },
//                             initialQuantity: initialQuantity,
//                           );
//                         },
//                       );
//                     }).toList(),
//                   )
//                 : const Center(child: CircularProgressIndicator()), // Loader
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ElevatedButton(
//               onPressed: controller.totalItems > 0 ? () {
//                 controller.showOrderSummary(context);
//                 // Print the selected food items and their quantities
//                 controller.itemDetails.forEach((foodId, details) {
//                   int quantity = details['quantity'];  

//                   if (quantity > 0) {
//                     print('الاي دي: $foodId,  اسم الوجبة: ${details['name']}, الكمية: $quantity');
//                   }
//                 });

//                 Get.snackbar('تم تاكيد الطلب', 'لقد تم طلب  ${controller.totalItems} وجبات');
//               } : null,
//               child: Text('تاكيد (${controller.totalItems})'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


//before sprated 
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
// import 'package:semo/const/colors.dart';
// import 'package:semo/controller/foodmenu_controller.dart';
// import 'package:semo/widgets/menu/priceand_count.dart';
// import '../data/model/foodrestaurants_model.dart';
// import '../linkapi.dart';

// class MenuPage extends StatefulWidget {
//   const MenuPage({super.key});

//   @override
//   _MenuPageState createState() => _MenuPageState();
// }

// class _MenuPageState extends State<MenuPage> with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   late FoodMenuController _controller;
//   late Map<String, dynamic> _foodMenuMap={};
//     // late Map<String, List<Map<String, dynamic>>> _foodMenuMap;

//   Map<String, Map<String, dynamic>> itemDetails = {}; // Map to hold food details
//   int totalItems = 0;Map<String, int> itemQuantities = {}; // Map to hold quantities per food item


//   @override
//   void initState() {
//     super.initState();
//     _controller = Get.put(FoodMenuController());
//     _controller.menu().then((_) {
//       setState(() {
//         _foodMenuMap = _transformFoodMenu(_controller.foodMenu);
//         _tabController = TabController(
//           length: _foodMenuMap.keys.length,
//           vsync: this,
//         );
//       });
//     });
//   }
//  void showOrderSummary() {
//   TextEditingController notesController = TextEditingController(); // Controller for notes input

//   List<Widget> orderItems = itemDetails.entries
//       .where((entry) => entry.value['quantity'] > 0)
//       .map((entry) {
//         return Text('الوجبة: ${entry.value['name']}, الكمية: ${entry.value['quantity']}');
//       }).toList();

//   showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         title: const Text('مراجعة الطلب'),
//         content: SingleChildScrollView(
//           child: SizedBox(
//             width: double.maxFinite, // Makes the dialog wider
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Container(
//                   constraints: BoxConstraints(
//                     maxHeight: MediaQuery.of(context).size.height * 0.4, // Set max height for orders
//                   ),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: orderItems,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16), // Space between items and notes
//                 Container(
//                   padding: const EdgeInsets.all(8.0), // Padding around the notes container
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey), // Border for the notes container
//                     borderRadius: BorderRadius.circular(8), // Rounded corners
//                   ),
//                   child: TextField(
//                     controller: notesController,
//                     decoration: const InputDecoration(
//                       labelText: 'ملاحظات الطلب ',
//                       border: InputBorder.none, // No border for the TextField
//                     ),
//                     maxLines: 3, // Allow for multiple lines
//                     keyboardType: TextInputType.multiline, // Allow multiline input
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop(); // Close the dialog
//             },
//             child: const Text('اغلاق'), // "Close" in Arabic
//           ),
//           TextButton(
//             onPressed: () {
//               // Handle order confirmation logic here
//               String notes = notesController.text;

//               // Print the selected food items and their quantities
//               itemDetails.forEach((foodId, details) {
//                 int quantity = details['quantity'];

//                 if (quantity > 0) {
//                   print('Food ID: $foodId, Food Name: ${details['name']}, Quantity: $quantity');
//                 }
//               });

//               // Print the notes as well
//               print('Order confirmed with notes: $notes');

//               // Show confirmation message
//               // Get.snackbar('Order Confirmed', 'You have ordered $totalItems items.');

//               Navigator.of(context).pop(); // Close the dialog after confirmation
//             },
//             child: const Text('تاكيد الطلب'), // "Confirm Order" in Arabic
//           ),
//         ],
//       );
//     },
//   );
// }


//   Map<String, List<Map<String, dynamic>>> _transformFoodMenu(List<dynamic> foodMenuList) {
//     final Map<String, List<Map<String, dynamic>>> map = {};
//     for (var item in foodMenuList) {
//       if (item is Map<String, dynamic>) {
//         String category = item['category'] as String;
//         List<dynamic> items = item['items'] as List<dynamic>;
//         List<Map<String, dynamic>> itemsList = items.whereType<Map<String, dynamic>>().map((e) => e).toList();
//         if (map.containsKey(category)) {
//           map[category]!.addAll(itemsList);
//         } else {
//           map[category] = itemsList;
//         }
//       }
//     }
//     return map;
//   }

//   void updateTotalItems(String foodId, int count) {
//     setState(() {
//       if (itemQuantities.containsKey(foodId)) {
//         itemQuantities[foodId] = (itemQuantities[foodId]! + count).clamp(0, double.infinity).toInt();
//       } else {
//         itemQuantities[foodId] = count;
//       }

//       totalItems = itemQuantities.values.reduce((a, b) => a + b);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("القائمة"),
//         centerTitle: true,
//         bottom: _foodMenuMap.isNotEmpty
//             ? TabBar(
//                 controller: _tabController,
//                 isScrollable: true,
//                 tabs: _foodMenuMap.keys.map((category) => Tab(text: category)).toList(),
//               )
//             : null,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: _foodMenuMap.isNotEmpty
//                 ? TabBarView(
//                     controller: _tabController,
//                     children: _foodMenuMap.entries.map((entry) {
//                       return ListView.builder(
//                         itemCount: entry.value.length,
//                         itemBuilder: (context, index) {
//                           var item = entry.value[index];
//                           String foodId = item['food_id'].toString(); // Ensure food_id is a string
//                           int initialQuantity = itemDetails[foodId]?['quantity'] ?? 0; // Get initial quantity

//                           return FoodMenu(
//                             foodRestaurantsModel: FoodRestaurantsModel.fromJson(item),
//                             mealType: entry.key,
//                             onUpdate: (count) {
//                               updateTotalItems(foodId, count);
//                             },
//                             onQuantityChange: (quantity) {
//                               itemDetails[foodId] = {
//                                 'name': item['food_name'], // Assuming food_name is in the item
//                                 'quantity': quantity,
//                               }; // Update the item details
//                             },
//                             initialQuantity: initialQuantity,
//                           );
//                         },
//                       );
//                     }).toList(),
//                   )
//                 : const Center(child: CircularProgressIndicator()), // Loader
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ElevatedButton(
//               onPressed: totalItems > 0 ? () {
//                 showOrderSummary();
//                 // Print the selected food items and their quantities
//                 itemDetails.forEach((foodId, details) {
//                   int quantity = details['quantity'];  

//                   if (quantity > 0) {
//                     print('Food ID: $foodId, Food Name: ${details['name']}, Quantity: $quantity');
//                   }
//                 });

//                 Get.snackbar('Order Confirmed', 'You have ordered $totalItems items.');
//               } : null,
//               child: Text('تاكيد ($totalItems)'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// class FoodMenu extends StatefulWidget {
//   final FoodRestaurantsModel foodRestaurantsModel;
//   final String mealType;
//   final Function(int) onUpdate; // Add callback for total items
//   final Function(int) onQuantityChange; // Add callback for individual quantity
//   final int initialQuantity; // Add initial quantity

//   const FoodMenu({
//     super.key,
//     required this.foodRestaurantsModel,
//     required this.mealType,
//     required this.onUpdate,
//     required this.onQuantityChange,
//     required this.initialQuantity,
//   });

//   @override
//   _FoodMenuState createState() => _FoodMenuState();
// }

// class _FoodMenuState extends State<FoodMenu> {
//   FoodMenuController controller = Get.find();
//   late int countItems;

//   @override
//   void initState() {
//     super.initState();
//     countItems = widget.initialQuantity; // Use initial quantity from parent widget
//   }

//   void incrementCountItems() {
//     setState(() {
//       countItems++;
//       widget.onUpdate(1); // Update total items
//       widget.onQuantityChange(countItems); // Update individual item quantity
//     });
//   }

//   void decrementCountItems() {
//     if (countItems > 0) {
//       setState(() {
//         countItems--;
//         widget.onUpdate(-1); // Update total items
//         widget.onQuantityChange(countItems); // Update individual item quantity
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
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
//                           padding: const EdgeInsetsDirectional.fromSTEB(5, 2, 2, 2),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(6),
//                             child: CachedNetworkImage(
//                               imageUrl: "${AppLink.foodImage}/${widget.foodRestaurantsModel.foodImage}",
//                               placeholder: (context, url) => Lottie.asset('assets/images/lottile/loadin_data.json'),
//                               errorWidget: (context, url, error) => Image.asset('assets/images/nofood.png'),
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
//                         onAdd: () {
//                           controller.additems(widget.foodRestaurantsModel.foodId!.toString());
//                           incrementCountItems();
//                         },
//                         onRemove: () {
//                           controller.deleteitems(widget.foodRestaurantsModel.foodId!.toString());
//                           decrementCountItems();
//                         },
//                         count: countItems.toString(),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 1),
//           ],
//         ),
//       ),
//     );
//   }
// }
