class FoodRestaurantsModel {
  
  int? foodId;
  int? foodRestaurantId;
  String? foodName;
  String? foodKind;
  String? foodDescription;
  int? foodPrice;
  String? foodImage;
  int? restaurantsId;
  String? restaurantsName;
  int? restaurantsAprove;
  String? restaurantsPassword;
  String? restaurantsToken;
  int? restaurantsStatus;
  String? resturantKind;
  String? restaurantsPhone;
  String? restaurantsCity;
  String? restaurantsLocation;
  int? restaurantsRole;
  String? restaurantsCreate;
  String? restaurantsImg;
  int? restaurantsCategoriesId;
  String? restaurantsCategoriesName;
  String? restaurantsDayOpen;
  String? restaurantsDayClose;
  String? restaurantsNightOpen;
  String? restaurantsNightClose;
  int? restaurantsVacation;

  FoodRestaurantsModel(
      {this.foodId,
      this.foodRestaurantId,
      this.foodName,
      this.foodKind,
      this.foodDescription,
      this.foodPrice,
      this.foodImage,
      this.restaurantsId,
      this.restaurantsName,
      this.restaurantsAprove,
      this.restaurantsPassword,
      this.restaurantsToken,
      this.restaurantsStatus,
      this.resturantKind,
      this.restaurantsPhone,
      this.restaurantsCity,
      this.restaurantsLocation,
      this.restaurantsRole,
      this.restaurantsCreate,
      this.restaurantsImg,
      this.restaurantsCategoriesId,
      this.restaurantsCategoriesName,
      this.restaurantsDayOpen,
      this.restaurantsDayClose,
      this.restaurantsNightOpen,
      this.restaurantsNightClose,
      this.restaurantsVacation});

  FoodRestaurantsModel.fromJson(Map<String, dynamic> json) {
    foodId = json['food_id'];
    foodRestaurantId = json['food_restaurant_id'];
    foodName = json['food_name'];
    foodKind = json['food_kind'];
    foodDescription = json['food_description'];
    foodPrice = json['food_price'];
    foodImage = json['food_image'];
    restaurantsId = json['restaurants_id'];
    restaurantsName = json['restaurants_name'];
    restaurantsAprove = json['restaurants_aprove'];
    restaurantsPassword = json['restaurants_password'];
    restaurantsToken = json['restaurants_token'];
    restaurantsStatus = json['restaurants_status'];
    resturantKind = json['resturant_kind'];
    restaurantsPhone = json['restaurants_phone'];
    restaurantsCity = json['restaurants_city'];
    restaurantsLocation = json['restaurants_location'];
    restaurantsRole = json['restaurants_role'];
    restaurantsCreate = json['restaurants_create'];
    restaurantsImg = json['restaurants_img'];
    restaurantsCategoriesId = json['restaurants_categories_id'];
    restaurantsCategoriesName = json['restaurants_categories_name'];
    restaurantsDayOpen = json['restaurants_day_open'];
    restaurantsDayClose = json['restaurants_day_close'];
    restaurantsNightOpen = json['restaurants_night_open'];
    restaurantsNightClose = json['restaurants_night_close'];
    restaurantsVacation = json['restaurants_vacation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['food_id'] = foodId;
    data['food_restaurant_id'] = foodRestaurantId;
    data['food_name'] = foodName;
    data['food_kind'] = foodKind;
    data['food_description'] = foodDescription;
    data['food_price'] = foodPrice;
    data['food_image'] = foodImage;
    data['restaurants_id'] = restaurantsId;
    data['restaurants_name'] = restaurantsName;
    data['restaurants_aprove'] = restaurantsAprove;
    data['restaurants_password'] = restaurantsPassword;
    data['restaurants_token'] = restaurantsToken;
    data['restaurants_status'] = restaurantsStatus;
    data['resturant_kind'] = resturantKind;
    data['restaurants_phone'] = restaurantsPhone;
    data['restaurants_city'] = restaurantsCity;
    data['restaurants_location'] = restaurantsLocation;
    data['restaurants_role'] = restaurantsRole;
    data['restaurants_create'] = restaurantsCreate;
    data['restaurants_img'] = restaurantsImg;
    data['restaurants_categories_id'] = restaurantsCategoriesId;
    data['restaurants_categories_name'] = restaurantsCategoriesName;
    data['restaurants_day_open'] = restaurantsDayOpen;
    data['restaurants_day_close'] = restaurantsDayClose;
    data['restaurants_night_open'] = restaurantsNightOpen;
    data['restaurants_night_close'] = restaurantsNightClose;
    data['restaurants_vacation'] = restaurantsVacation;
    return data;
  }
bool isOpen() {
  // Check if the restaurant is on vacation
  if (restaurantsVacation == 1) {
    return false; // Restaurant is on vacation
  }

  // Get current time
  final now = DateTime.now();
  print("Current time: $now");

  // Print input time strings
  print("Day Open String: $restaurantsDayOpen");
  print("Day Close String: $restaurantsDayClose");
  print("Night Open String: $restaurantsNightOpen");
  print("Night Close String: $restaurantsNightClose");

  // Parse opening and closing times
  DateTime? dayOpen = _parseTimeToDateTime(restaurantsDayOpen, now);
  DateTime? dayClose = _parseTimeToDateTime(restaurantsDayClose, now);
  DateTime? nightOpen = _parseTimeToDateTime(restaurantsNightOpen, now);
  DateTime? nightClose = _parseTimeToDateTime(restaurantsNightClose, now);

  print("Day Open: $dayOpen");
  print("Day Close: $dayClose");
  print("Night Open: $nightOpen");
  print("Night Close: $nightClose");

  // Check day shift
  if (dayOpen != null && dayClose != null &&
      now.isAfter(dayOpen) && now.isBefore(dayClose)) {
    return true; // Open during day shift
  }

  // Check night shift
  if (nightOpen != null && nightClose != null &&
      now.isAfter(nightOpen) && now.isBefore(nightClose)) {
    return true; // Open during night shift
  }

  return false; // Closed
}

// Helper method to parse time strings like "HH:mm:ss" to DateTime
DateTime? _parseTimeToDateTime(String? time, DateTime currentDate) {
  if (time == null) return null;
  try {
    final parts = time.split(':');
    if (parts.length >= 2) { // Check for HH:mm or HH:mm:ss
      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);
      // If seconds are present, we can ignore them
      return DateTime(currentDate.year, currentDate.month, currentDate.day, hour, minute);
    }
  } catch (e) {
    print("Error parsing time: $time. Exception: $e");
  }
  return null;
}
}