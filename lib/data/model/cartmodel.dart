class CartModel {
  String? itemsprice;
  String? countitems;
  String? cartId;
  String? cartItemsid;
  String? cartUsersid;
  String? cartOrders;
  String? restaurantsId;
  String? restaurantsName;
  String? resturantKind;
  String? restaurantsPhone;
  String? restaurantsCity;
  String? restaurantsLocation;
  String? restaurantsCreate;
  String? restaurantsImg;
  String? restaurantsCategoriesId;
  String? restaurantsCategoriesName;
  String? categoriesId;
  String? categoriesName;
  String? parentCategoriesId;
  String? categoriesImage;
  String? categoriesCreate;
  String? categoriesNp;
  String? foodId;
  String? foodRestaurantId;
  String? foodName;
  String? foodKind;
  String? foodDescription;
  String? foodPrice;
  String? foodImage;

  CartModel(
      {this.itemsprice,
      this.countitems,
      this.cartId,
      this.cartItemsid,
      this.cartUsersid,
      this.cartOrders,
      this.restaurantsId,
      this.restaurantsName,
      this.resturantKind,
      this.restaurantsPhone,
      this.restaurantsCity,
      this.restaurantsLocation,
      this.restaurantsCreate,
      this.restaurantsImg,
      this.restaurantsCategoriesId,
      this.restaurantsCategoriesName,
      this.categoriesId,
      this.categoriesName,
      this.parentCategoriesId,
      this.categoriesImage,
      this.categoriesCreate,
      this.categoriesNp,
      this.foodId,
      this.foodRestaurantId,
      this.foodName,
      this.foodKind,
      this.foodDescription,
      this.foodPrice,
      this.foodImage});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemsprice = json['itemsprice'];
    countitems = json['countitems'];
    cartId = json['cart_id'];
    cartItemsid = json['cart_itemsid'];
    cartUsersid = json['cart_usersid'];
    cartOrders = json['cart_orders'];
    restaurantsId = json['restaurants_id'];
    restaurantsName = json['restaurants_name'];
    resturantKind = json['resturant_kind'];
    restaurantsPhone = json['restaurants_phone'];
    restaurantsCity = json['restaurants_city'];
    restaurantsLocation = json['restaurants_location'];
    restaurantsCreate = json['restaurants_create'];
    restaurantsImg = json['restaurants_img'];
    restaurantsCategoriesId = json['restaurants_categories_id'];
    restaurantsCategoriesName = json['restaurants_categories_name'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    parentCategoriesId = json['parent_categories_id'];
    categoriesImage = json['categories_image'];
    categoriesCreate = json['categories_create'];
    categoriesNp = json['categories_np'];
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
    data['itemsprice'] = itemsprice;
    data['countitems'] = countitems;
    data['cart_id'] = cartId;
    data['cart_itemsid'] = cartItemsid;
    data['cart_usersid'] = cartUsersid;
    data['cart_orders'] = cartOrders;
    data['restaurants_id'] = restaurantsId;
    data['restaurants_name'] = restaurantsName;
    data['resturant_kind'] = resturantKind;
    data['restaurants_phone'] = restaurantsPhone;
    data['restaurants_city'] = restaurantsCity;
    data['restaurants_location'] = restaurantsLocation;
    data['restaurants_create'] = restaurantsCreate;
    data['restaurants_img'] = restaurantsImg;
    data['restaurants_categories_id'] = restaurantsCategoriesId;
    data['restaurants_categories_name'] = restaurantsCategoriesName;
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesName;
    data['parent_categories_id'] = parentCategoriesId;
    data['categories_image'] = categoriesImage;
    data['categories_create'] = categoriesCreate;
    data['categories_np'] = categoriesNp;
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