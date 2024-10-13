class RestaurantModel {
  int? restaurantsId;
  String? restaurantsName;
  String? restaurantsPhone;
  String? restaurantsCity;
  String? restaurantsLocation;
  String? restaurantsCreate;
  String? restaurantsImg;
  String? restaurantsCategoriesName;
  String? restaurantKind;


  RestaurantModel(
      {this.restaurantsId,
      this.restaurantsName,
      this.restaurantsPhone,
      this.restaurantsCity,
      this.restaurantsLocation,
      this.restaurantsCreate,
      this.restaurantsImg,
      this.restaurantsCategoriesName,
      this.restaurantKind,
      
      });

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    restaurantsId = json['restaurants_id'];
    restaurantsName = json['restaurants_name'];
    restaurantsPhone = json['restaurants_phone'];
    restaurantsCity = json['restaurants_city'];
    restaurantsLocation = json['restaurants_location'];
    restaurantsCreate = json['restaurants_create'];
    restaurantsImg = json['restaurants_img'];
    restaurantsCategoriesName = json['restaurants_categories_name'];
    restaurantKind = json['resturant_kind'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['restaurants_id'] = restaurantsId;
    data['restaurants_name'] = restaurantsName;
    data['restaurants_phone'] = restaurantsPhone;
    data['restaurants_city'] = restaurantsCity;
    data['restaurants_location'] = restaurantsLocation;
    data['restaurants_create'] = restaurantsCreate;
    data['restaurants_img'] = restaurantsImg;
    data['restaurants_categories_name'] = restaurantsCategoriesName;
    data['resturant_kind'] = restaurantKind;
    return data;
  }
}
