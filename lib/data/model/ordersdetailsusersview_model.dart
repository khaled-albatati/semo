class OrdersDetailsUsersViewModel {
  int? foodprice;
  int? countitems;
  int? cartId;
  int? cartItemsid;
  int? cartUsersid;
  int? cartOrders;
  int? cartCaptainId;
  int? foodId;
  int? foodRestaurantId;
  String? foodName;
  String? foodKind;
  String? foodDescription;
  int? foodPrice;
  String? foodImage;
  int? ordersId;
  int? ordersUsersid;
  int? ordersAddress;
  int? ordersPricedelivery;
  int? ordersPrice;
  int? ordersTotalprice;
  int? ordersCoupon;
  int? ordersRating;
  String? ordersNoterating;
  int? ordersPaymentmethod;
  int? ordersStatus;
  String? ordersDatetime;
  int? addressId;
  int? addressUsersid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLong;
  int? userId;
  String? userName;
  String? userPhone;
  String? usersWhats;
  String? userEmail;
  String? userPassword;
  String? userToken;
  String? userCreate;
  String? userVerifycode;
  int? userAprrove;
  int? userRole;
  String? userRoleName;
  int? userWallet;
  int? orderStatusId;
  String? orderStatusName;
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
  int? captainId;
  String? captainName;
  String? captainPassword;
  String? captainPhone;
  String? captainEmail;
  String? captainCreate;
  String? captainFcmtoken;
  int? captainVacation;
  int? captainStatus;

  OrdersDetailsUsersViewModel(
      {this.foodprice,
      this.countitems,
      this.cartId,
      this.cartItemsid,
      this.cartUsersid,
      this.cartOrders,
      this.cartCaptainId,
      this.foodId,
      this.foodRestaurantId,
      this.foodName,
      this.foodKind,
      this.foodDescription,
      this.foodPrice,
      this.foodImage,
      this.ordersId,
      this.ordersUsersid,
      this.ordersAddress,
      this.ordersPricedelivery,
      this.ordersPrice,
      this.ordersTotalprice,
      this.ordersCoupon,
      this.ordersRating,
      this.ordersNoterating,
      this.ordersPaymentmethod,
      this.ordersStatus,
      this.ordersDatetime,
      this.addressId,
      this.addressUsersid,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong,
      this.userId,
      this.userName,
      this.userPhone,
      this.usersWhats,
      this.userEmail,
      this.userPassword,
      this.userToken,
      this.userCreate,
      this.userVerifycode,
      this.userAprrove,
      this.userRole,
      this.userRoleName,
      this.userWallet,
      this.orderStatusId,
      this.orderStatusName,
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
      this.restaurantsVacation,
      this.captainId,
      this.captainName,
      this.captainPassword,
      this.captainPhone,
      this.captainEmail,
      this.captainCreate,
      this.captainFcmtoken,
      this.captainVacation,
      this.captainStatus});

  OrdersDetailsUsersViewModel.fromJson(Map<String, dynamic> json) {
    foodprice = json['foodprice'];
    countitems = json['countitems'];
    cartId = json['cart_id'];
    cartItemsid = json['cart_itemsid'];
    cartUsersid = json['cart_usersid'];
    cartOrders = json['cart_orders'];
    cartCaptainId = json['cart_captain_id'];
    foodId = json['food_id'];
    foodRestaurantId = json['food_restaurant_id'];
    foodName = json['food_name'];
    foodKind = json['food_kind'];
    foodDescription = json['food_description'];
    foodPrice = json['food_price'];
    foodImage = json['food_image'];
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersAddress = json['orders_address'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersPrice = json['orders_price'];
    ordersTotalprice = json['orders_totalprice'];
    ordersCoupon = json['orders_coupon'];
    ordersRating = json['orders_rating'];
    ordersNoterating = json['orders_noterating'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersStatus = json['orders_status'];
    ordersDatetime = json['orders_datetime'];
    addressId = json['address_id'];
    addressUsersid = json['address_usersid'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
    userId = json['user_id'];
    userName = json['user_name'];
    userPhone = json['user_phone'];
    usersWhats = json['users_whats'];
    userEmail = json['user_email'];
    userPassword = json['user_password'];
    userToken = json['user_token'];
    userCreate = json['user_create'];
    userVerifycode = json['user_verifycode'];
    userAprrove = json['user_aprrove'];
    userRole = json['user_role'];
    userRoleName = json['user_role_name'];
    userWallet = json['user_wallet'];
    orderStatusId = json['order_status_id'];
    orderStatusName = json['order_status_name'];
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
    captainId = json['captain_id'];
    captainName = json['captain_name'];
    captainPassword = json['captain_password'];
    captainPhone = json['captain_phone'];
    captainEmail = json['captain_email'];
    captainCreate = json['captain_create'];
    captainFcmtoken = json['captain_fcmtoken'];
    captainVacation = json['captain_vacation'];
    captainStatus = json['captain_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['foodprice'] = foodprice;
    data['countitems'] = countitems;
    data['cart_id'] = cartId;
    data['cart_itemsid'] = cartItemsid;
    data['cart_usersid'] = cartUsersid;
    data['cart_orders'] = cartOrders;
    data['cart_captain_id'] = cartCaptainId;
    data['food_id'] = foodId;
    data['food_restaurant_id'] = foodRestaurantId;
    data['food_name'] = foodName;
    data['food_kind'] = foodKind;
    data['food_description'] = foodDescription;
    data['food_price'] = foodPrice;
    data['food_image'] = foodImage;
    data['orders_id'] = ordersId;
    data['orders_usersid'] = ordersUsersid;
    data['orders_address'] = ordersAddress;
    data['orders_pricedelivery'] = ordersPricedelivery;
    data['orders_price'] = ordersPrice;
    data['orders_totalprice'] = ordersTotalprice;
    data['orders_coupon'] = ordersCoupon;
    data['orders_rating'] = ordersRating;
    data['orders_noterating'] = ordersNoterating;
    data['orders_paymentmethod'] = ordersPaymentmethod;
    data['orders_status'] = ordersStatus;
    data['orders_datetime'] = ordersDatetime;
    data['address_id'] = addressId;
    data['address_usersid'] = addressUsersid;
    data['address_name'] = addressName;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    data['user_id'] = userId;
    data['user_name'] = userName;
    data['user_phone'] = userPhone;
    data['users_whats'] = usersWhats;
    data['user_email'] = userEmail;
    data['user_password'] = userPassword;
    data['user_token'] = userToken;
    data['user_create'] = userCreate;
    data['user_verifycode'] = userVerifycode;
    data['user_aprrove'] = userAprrove;
    data['user_role'] = userRole;
    data['user_role_name'] = userRoleName;
    data['user_wallet'] = userWallet;
    data['order_status_id'] = orderStatusId;
    data['order_status_name'] = orderStatusName;
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
    data['captain_id'] = captainId;
    data['captain_name'] = captainName;
    data['captain_password'] = captainPassword;
    data['captain_phone'] = captainPhone;
    data['captain_email'] = captainEmail;
    data['captain_create'] = captainCreate;
    data['captain_fcmtoken'] = captainFcmtoken;
    data['captain_vacation'] = captainVacation;
    data['captain_status'] = captainStatus;
    return data;
  }
}