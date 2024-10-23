class RestaurantsModel {
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

  RestaurantsModel(
      {this.restaurantsId,
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

  RestaurantsModel.fromJson(Map<String, dynamic> json) {
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
}