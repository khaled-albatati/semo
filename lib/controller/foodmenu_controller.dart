import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/core/class/statusrequiest.dart';
import 'package:http/http.dart' as http;
import 'package:semo/core/constant/routes.dart';
import 'package:semo/core/constant/zero.dart';
import 'package:semo/data/model/foodrestaurants_model.dart';
import 'package:semo/linkapi.dart';
import '../../core/functions/handlingdata_controller.dart';
import '../core/services/services.dart';
import 'count_controller.dart';

//صفحة عرض المطاعم بعد اختيار الكاتيقوري

class FoodMenuController extends GetxController {
  List foodMenu = []; //متغير لتخزين البيانات بعد جلبها من ال backend .
  List categories = [];
  List categoriesmenua = [];
  List categoriess = [];
  List categoriesmenu = [];
  int convertedValue = 0;
  String? categoriesName;
  List<String> foodMenuTypes = [];
  List mealType = [];
  int countitems = 0;
  late FoodRestaurantsModel foodRestaurantsModel;
  CountController cartController = Get.put(CountController());
  late StatusRequiest statusRequiest;
  int? catid;
  int? selectedCat;
  MyServices myServices = Get.find();
    double totalPrice = 0.0;
    late String restaurants_location;
  late TabController tabController;
  late FoodMenuController food;
  String? notes;
  late Map<String, dynamic> foodMenuMap = {};
  // late Map<String, List<Map<String, dynamic>>> _foodMenuMap;
  Map<String, Map<String, dynamic>> itemDetails =
      {}; // Map to hold food details
  int totalItems = 0;
  Map<String, int> itemQuantities = {}; // Map to hold quantities per food item

 double calculateTotalPrice() {
  totalPrice = 0.0; // Reset totalPrice at the start

  itemDetails.forEach((foodId, details) {
    int quantity = details['quantity'];
    double price = details['price']; // Use food_price here
    totalPrice += quantity * price; // Calculate total price
  });

  return totalPrice;
}

  void showOrderSummary(BuildContext context) {
  TextEditingController notesController = TextEditingController();

  List<Widget> orderItems = itemDetails.entries
      .where((entry) => entry.value['quantity'] > 0)
      .map((entry) {
    return Text('الوجبة: ${entry.value['name']}, الكمية: ${entry.value['quantity']}');
  }).toList();

  double totalPrice = calculateTotalPrice(); // This will now return the correct total

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('مراجعة الطلب'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...orderItems,
              const SizedBox(height: 16),
              Text('إجمالي السعر: ${totalPrice.toStringAsFixed(2)} ريال'),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: notesController,
                  decoration: const InputDecoration(
                    labelText: 'ملاحظات الطلب',
                    border: InputBorder.none,
                  ),
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('اغلاق'),
          ),
            TextButton(
              onPressed: () {
                // Handle order confirmation logic here
                 notes = notesController.text;
                if (kDebugMode) {
                  print('طباعة الطلب: $notes');
                }

                // Print the selected food items and their quantities
                double totalPrice =
                    calculateTotalPrice(); // Recalculate total price for confirmation
                itemDetails.forEach((foodId, details) {
                  int quantity = details['quantity'];
                  if (quantity > 0) {
                    if (kDebugMode) {
                    send(foodId, quantity);
                      print(
                        'Food ID: $foodId, Food Name: ${details['name']}, Quantity: $quantity');
                    }
                    print('==============================: first: $foodId =================: second: $quantity');
                  }
                });

                  Get.toNamed(
                    AppRoutes.payment,
                    arguments: {'total_price': totalPrice,'restaurants_location':restaurants_location,'notes':notesController.text}, // Use a map to pass the arguments
                  );
                // Print total price
                if (kDebugMode) {
                  print(
                    'الإجمالي: ريال${totalPrice.toStringAsFixed(2)}');
                } // Print total price in Arabic

                Navigator.of(context)
                    .pop(); // Close the dialog after confirmation
              },
              
                child: const Text('تاكيد الطلب'), // "Confirm Order" in Arabic
              ),
            
          ],
        );
      },
    );
  }

  Future<void> send(String foodid, int quantity) async {
  statusRequiest = StatusRequiest.loading;
  final userId = myServices.sharedPreferences.getInt('id');

  try {
    for (int i = 0; i < quantity; i++) {
      var response = await http.post(Uri.parse(AppLink.cartadd), body: {
        "usersid": userId.toString(),
        "itemsid": foodid,
      });

      if (response.statusCode == 200) {
        // Handle success (you may want to update your state or show a message)
       Get.toNamed(
      AppRoutes.payment,
      arguments: {
        'total_price': totalPrice,
        'restaurants_location': restaurants_location,
        'notes': notes.toString(),
      },
    );
      } else {
        statusRequiest = StatusRequiest.faliure;
        break; // Exit the loop if there's an error
      }
    }
  } catch (e) {
    statusRequiest = StatusRequiest.serverException;
  }
  update();
}

  @override
  void onInit() async {
    
    onBackInit();
    resetCart();
    statusRequiest = StatusRequiest.loading;
    catid = Get.arguments['catid'];
    if (kDebugMode) {
      print('===========================$catid');
    }
    // foodRestaurantsModel = FoodRestaurantsModel();
    categories = Get.arguments['categories'];
    categoriess = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    categoriesName = Get.arguments['categoriesname'];
    foodRestaurantsModel = Get.arguments['foodRestaurantsModel'];
    restaurants_location=Get.arguments['restaurants_location'];
    // print('-========================');
    // print('cat id = ${catid} '); //categories_id
    // print('categories = ${categories}'); //list data
    // print('selected cat = ${selectedCat}'); //null
    // print('categoriesName = ${categoriesName}');//categories_name
    // print(' hhhhhhhhhhhere = ${foodRestaurantsModel.restaurantsName}');
    print('location :         $restaurants_location');
    menu();
    meal(categories);
    meall(categories);
    // countitems;
    super.onInit();
  }

  Future menu() async {
    statusRequiest = StatusRequiest.loading;
    try {
      var response = await http.post(Uri.parse(AppLink.menu), body: {
        'restaurants_id': foodRestaurantsModel.restaurantsId.toString(),
      });

      if (response.statusCode == 200) {
        final jsondata = jsonDecode(response.body);
        if (jsondata['status'] == 'success') {
          // Clear previous data
          foodMenu.clear();
          // Iterate over the categories
          jsondata['data'].forEach((key, value) {
            foodMenu.add({
              'category': key,
              'items': value,
            });
          });
          statusRequiest = StatusRequiest.success;
        } else {
          statusRequiest = StatusRequiest.faliure;
        }
      } else {
        statusRequiest = StatusRequiest.faliure;
      }
    } catch (e) {
      statusRequiest = StatusRequiest.serverException;
      if (kDebugMode) {
        print("Error: $e");
      }
    }
    update();
  }

  meal(foodkind) async {
    categoriesmenu.clear();
    statusRequiest = StatusRequiest.loading;
    try {
      var response = await http.post(Uri.parse(AppLink.menucatlist), body: {
        'restaurants_name': foodRestaurantsModel.restaurantsName,
        'food_kind': foodkind, // Pass the mealType parameter to the API
        'userid': myServices.sharedPreferences.getString('id'),
      });

      statusRequiest = handlingData(response);

      if (response.statusCode == 200) {
        final jsondata = jsonDecode(response.body);
        categoriesmenu.addAll(jsondata['data']);
        statusRequiest = StatusRequiest.success;
      } else {
        statusRequiest = StatusRequiest.faliure;
      }
    } catch (e) {
      statusRequiest = StatusRequiest.serverException;
    }
    update();
  }

  Future<void> meall(foodkind) async {
    update();
    categoriesmenu.clear();
    statusRequiest = StatusRequiest.loading;
    try {
      var response =
          await http.post(Uri.parse(AppLink.menucatlistcount), body: {
        'restaurants_name': foodRestaurantsModel.restaurantsName,
        'food_kind': foodkind, // Pass the mealType parameter to the API
        'userid': myServices.sharedPreferences.getString('id'),
      });

      statusRequiest = handlingData(response);

      if (response.statusCode == 200) {
        final jsondata = jsonDecode(response.body);
        categoriesmenua.addAll(jsondata['data']);
        statusRequiest = StatusRequiest.success;
      } else {
        statusRequiest = StatusRequiest.faliure;
      }
    } catch (e) {
      statusRequiest = StatusRequiest.serverException;
    }
    update();
  }

  Future additems(String foodid) async {
    // update();
    // statusRequiest = StatusRequiest.loading;
    try {
      final response = await http.post(Uri.parse(AppLink.cartadd), body: {
        "usersid": myServices.sharedPreferences.getString("id")!,
        "foodid": foodid,
      });
      if (response.statusCode == 200) {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تمت اضافة وجبة الى السلة"));
        statusRequiest = StatusRequiest.success;
      } else {
        statusRequiest = StatusRequiest.faliure;
      }
    } catch (e) {
      statusRequiest = StatusRequiest.serverException;
    }
    // update();
  }

  Future deleteitems(String foodid) async {
    // update();
    // statusRequiest = StatusRequiest.loading;
    try {
      final response = await http.post(Uri.parse(AppLink.cartdelete), body: {
        'foodid': foodid,
        'usersid': myServices.sharedPreferences.getString('id')!
      });

      // statusRequiest = handlingData(response);
      if (response.statusCode == 200) {
        Get.rawSnackbar(
            title: "اشعار", messageText: const Text("تم ازالة وجبة"));
        statusRequiest = StatusRequiest.success;
      } else {
        statusRequiest = StatusRequiest.faliure;
      }

      // update();
    } catch (e) {
      statusRequiest = StatusRequiest.serverException;
    }
  }

  goToCheckOut() {
    Get.toNamed(
      AppRoutes.cart,
    );
  }

  add() {
    additems(
      foodRestaurantsModel.foodId!.toString(),
    );
    countitems++;
    update();
  }

  onRemove() {
    if (countitems > 0) {
      deleteitems(foodRestaurantsModel.foodId!.toString());
      countitems--;
    }
    update();
  }
void resetOrder() {
  itemQuantities.clear();
  itemDetails.clear();
  totalItems = 0;
  totalPrice = 0.0;
}
  onBack() async {
    // statusRequiest = StatusRequiest.loading;
    update();
    try {
      final response = await http.post(Uri.parse(AppLink.deleteCount),
          body: {'usersid': myServices.sharedPreferences.getString('id')!});
      // statusRequiest = handlingData(response);
      if (response.statusCode == 200) {
        // Get.rawSnackbar(
        //     title: "اشعار", messageText: const Text("تم ازالة وجبة"));
        statusRequiest = StatusRequiest.success;
        Get.back();
      } else {
        statusRequiest = StatusRequiest.faliure;
      }
      update();
    } catch (e) {
      statusRequiest = StatusRequiest.serverException;
    }
  }

resetCart()async{
   try {
      final response = await http.post(Uri.parse(AppLink.cartReset), body: {
        'usersid': myServices.sharedPreferences.getInt('id').toString()
      });

      // statusRequiest = handlingData(response);
      if (response.statusCode == 200) {
        statusRequiest = StatusRequiest.success;
      } else {
        statusRequiest = StatusRequiest.faliure;
      }

      // update();
    } catch (e) {
      statusRequiest = StatusRequiest.serverException;
    }
  
}
  changeCat(val, catval) async {
    selectedCat = val;
    catid = catval;
    meal(catid);
    update();
  }
}
