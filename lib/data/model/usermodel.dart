class UserModel {
  String? userId;
  String? userName;
  String? userImage;
  String? userCreate;

  UserModel({
    this.userId,
    this.userName,
    this.userImage,
    this.userCreate,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userImage = json['user_image'];
    userCreate = json['user_create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['user_name'] = userName;
    data['user_image'] = userImage;
    data['user_create'] = userCreate;
    return data;
  }
}
