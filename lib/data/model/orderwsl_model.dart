class OrderWsl {
  int? addressOrderId;
  String? addressOrderSource;
  String? addressOrderDestination;
  int? addressOrderPrice;
  String? addressOrderDetails;
  int? addressOrderUserid;
  String? addressOrderTime;
  int? addressOrderStatus;
  int? userId;
  String? userName;
  String? userPhone;
  String? userEmail;
  String? userPassword;
  String? userCreate;
  int? userAprrove;
  int? userRole;
  String? userRoleName;
  int? userWallet;
  int? orderStatusId;
  String? orderStatusName;

  OrderWsl(
      {this.addressOrderId,
      this.addressOrderSource,
      this.addressOrderDestination,
      this.addressOrderPrice,
      this.addressOrderDetails,
      this.addressOrderUserid,
      this.addressOrderTime,
      this.addressOrderStatus,
      this.userId,
      this.userName,
      this.userPhone,
      this.userEmail,
      this.userPassword,
      this.userCreate,
      this.userAprrove,
      this.userRole,
      this.userRoleName,
      this.userWallet,
      this.orderStatusId,
      this.orderStatusName});

  OrderWsl.fromJson(Map<String, dynamic> json) {
    addressOrderId = json['address_order_id'];
    addressOrderSource = json['address_order_source'];
    addressOrderDestination = json['address_order_destination'];
    addressOrderPrice = json['address_order_price'];
    addressOrderDetails = json['address_order_details'];
    addressOrderUserid = json['address_order_userid'];
    addressOrderTime = json['address_order_time'];
    addressOrderStatus = json['address_order_status'];
    userId = json['user_id'];
    userName = json['user_name'];
    userPhone = json['user_phone'];
    userEmail = json['user_email'];
    userPassword = json['user_password'];
    userCreate = json['user_create'];
    userAprrove = json['user_aprrove'];
    userRole = json['user_role'];
    userRoleName = json['user_role_name'];
    userWallet = json['user_wallet'];
    orderStatusId = json['order_status_id'];
    orderStatusName = json['order_status_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address_order_id'] = addressOrderId;
    data['address_order_source'] = addressOrderSource;
    data['address_order_destination'] = addressOrderDestination;
    data['address_order_price'] = addressOrderPrice;
    data['address_order_details'] = addressOrderDetails;
    data['address_order_userid'] = addressOrderUserid;
    data['address_order_time'] = addressOrderTime;
    data['address_order_status'] = addressOrderStatus;
    data['user_id'] = userId;
    data['user_name'] = userName;
    data['user_phone'] = userPhone;
    data['user_email'] = userEmail;
    data['user_password'] = userPassword;
    data['user_create'] = userCreate;
    data['user_aprrove'] = userAprrove;
    data['user_role'] = userRole;
    data['user_role_name'] = userRoleName;
    data['user_wallet'] = userWallet;
    data['order_status_id'] = orderStatusId;
    data['order_status_name'] = orderStatusName;
    return data;
  }
}