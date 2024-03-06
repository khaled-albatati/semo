class FoodRestaurantsModel {
  String? foodId;
  String? foodRestaurantId;
  String? foodName;
  String? foodKind;
  String? foodDescription;
  String? foodPrice;
  String? foodImage;
  String? restaurantsId;
  String? restaurantsName;
  String? restaurantsPhone;
  String? restaurantsCity;
  String? restaurantsLocation;
  String? restaurantsCreate;
  String? restaurantsImg;
  String? restaurantsCategoriesName;
  String? categoriesId;
  String? categoriesName;
  String? parentCategoriesId;
  String? categoriesImage;
  String? categoriesCreate;
  String? categoriesNp;
  String? cartCount;
  String? unfinishedorders;
  String? countitems;

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
      this.restaurantsPhone,
      this.restaurantsCity,
      this.restaurantsLocation,
      this.restaurantsCreate,
      this.restaurantsImg,
      this.restaurantsCategoriesName,
      this.categoriesId,
      this.categoriesName,
      this.parentCategoriesId,
      this.categoriesImage,
      this.categoriesCreate,
      this.categoriesNp,
      this.cartCount,
      this.unfinishedorders,
      this.countitems,
      });

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
    restaurantsPhone = json['restaurants_phone'];
    restaurantsCity = json['restaurants_city'];
    restaurantsLocation = json['restaurants_location'];
    restaurantsCreate = json['restaurants_create'];
    restaurantsImg = json['restaurants_img'];
    restaurantsCategoriesName = json['restaurants_categories_name'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    parentCategoriesId = json['parent_categories_id'];
    categoriesImage = json['categories_image'];
    categoriesCreate = json['categories_create'];
    categoriesNp = json['categories_np'];
    cartCount = json['cart_count'];
    unfinishedorders= json['unfinished_orders'];
    countitems= json['countitems'];
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
    data['restaurants_phone'] = restaurantsPhone;
    data['restaurants_city'] = restaurantsCity;
    data['restaurants_location'] = restaurantsLocation;
    data['restaurants_create'] = restaurantsCreate;
    data['restaurants_img'] = restaurantsImg;
    data['restaurants_categories_name'] = restaurantsCategoriesName;
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesName;
    data['parent_categories_id'] = parentCategoriesId;
    data['categories_image'] = categoriesImage;
    data['categories_create'] = categoriesCreate;
    data['categories_np'] = categoriesNp;
    data['cart_count'] = cartCount;
    data['unfinished_orders']=unfinishedorders;
    data['countitems']=countitems;
    return data;
  }
}