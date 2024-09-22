import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/controller/foodmenu_controller.dart';
import '../data/model/foodrestaurants_model.dart';
import '../widgets/menu_page/menu.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> with SingleTickerProviderStateMixin {
FoodMenuController controller = Get.put(FoodMenuController());

  @override
  void initState() {
    super.initState();
    controller.food = Get.put(FoodMenuController());
    controller.food.menu().then((_) {
      setState(() {
        controller.foodMenuMap = _transformFoodMenu(controller.food.foodMenu);
        controller.tabController = TabController(
          length: controller.foodMenuMap.keys.length,
          vsync: this,
        );
      });
    });
  }
 

  Map<String, List<Map<String, dynamic>>> _transformFoodMenu(List<dynamic> foodMenuList) {
    final Map<String, List<Map<String, dynamic>>> map = {};
    for (var item in foodMenuList) {
      if (item is Map<String, dynamic>) {
        String category = item['category'] as String;
        List<dynamic> items = item['items'] as List<dynamic>;
        List<Map<String, dynamic>> itemsList = items.whereType<Map<String, dynamic>>().map((e) => e).toList();
        if (map.containsKey(category)) {
          map[category]!.addAll(itemsList);
        } else {
          map[category] = itemsList;
        }
      }
    }
    return map;
  }

  void updateTotalItems(String foodId, int count) {
    setState(() {
      if (controller.itemQuantities.containsKey(foodId)) {
        controller.itemQuantities[foodId] = (controller.itemQuantities[foodId]! + count).clamp(0, double.infinity).toInt();
      } else {
        controller.itemQuantities[foodId] = count;
      }

      controller.totalItems = controller.itemQuantities.values.reduce((a, b) => a + b);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("القائمة"),
        centerTitle: true,
        bottom: controller.foodMenuMap.isNotEmpty
            ? TabBar(
                controller: controller.tabController,
                isScrollable: true,
                tabs: controller.foodMenuMap.keys.map((category) => Tab(text: category)).toList(),
              )
            : null,
      ),
      body: Column(
        children: [
          Expanded(
            child: controller.foodMenuMap.isNotEmpty
                ? TabBarView(
                    controller: controller.tabController,
                    children: controller.foodMenuMap.entries.map((entry) {
                      return ListView.builder(
                        itemCount: entry.value.length,
                        itemBuilder: (context, index) {
                          var item = entry.value[index];
                          String foodId = item['food_id'].toString(); // Ensure food_id is a string
                          int initialQuantity = controller.itemDetails[foodId]?['quantity'] ?? 0; // Get initial quantity

                          return FoodMenu(
                            foodRestaurantsModel: FoodRestaurantsModel.fromJson(item),
                            mealType: entry.key,
                            onUpdate: (count) {
                              updateTotalItems(foodId, count);
                            },
onQuantityChange: (quantity) {
  controller.itemDetails[foodId] = {
    'name': item['food_name'],
    'quantity': quantity,
    'price': (item['food_price'] is int) ? (item['food_price'] as int).toDouble() : item['food_price'],  // Ensure price is double
  };
},
                            initialQuantity: initialQuantity,
                          );
                        },
                      );
                    }).toList(),
                  )
                : const Center(child: CircularProgressIndicator()), // Loader
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: controller.totalItems > 0 ? () {
                controller.showOrderSummary(context);
                // Print the selected food items and their quantities
                controller.itemDetails.forEach((foodId, details) {
                  int quantity = details['quantity'];  

                  if (quantity > 0) {
                    print('الاي دي: $foodId,  اسم الوجبة: ${details['name']}, الكمية: $quantity');
                  }
                });

                Get.snackbar('تم تاكيد الطلب', 'لقد تم طلب  ${controller.totalItems} وجبات');
              } : null,
              child: Text('تاكيد (${controller.totalItems})'),
            ),
          ),
        ],
      ),
    );
  }
}