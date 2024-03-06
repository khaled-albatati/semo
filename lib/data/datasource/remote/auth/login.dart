import 'package:semo/linkapi.dart';

import '../../../../core/class/crud.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postdata(String username, String password) async {
    var response = await crud.postData(AppLink.login, {
      "username": username,
      // "phone": phone,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
