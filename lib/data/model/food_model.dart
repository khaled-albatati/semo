class FoodModel {
  int? foodId;
  int? foodRestaurantId;
  String? foodName;
  String? foodKind;
  String? foodDescription;
  int? foodPrice;
  String? foodImage;

  FoodModel(
      {this.foodId,
      this.foodRestaurantId,
      this.foodName,
      this.foodKind,
      this.foodDescription,
      this.foodPrice,
      this.foodImage});

  FoodModel.fromJson(Map<String, dynamic> json) {
    foodId = json['food_id'];
    foodRestaurantId = json['food_restaurant_id'];
    foodName = json['food_name'];
    foodKind = json['food_kind'];
    foodDescription = json['food_description'];
    foodPrice = json['food_price'];
    foodImage = json['food_image'];
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
    return data;
  }
}
