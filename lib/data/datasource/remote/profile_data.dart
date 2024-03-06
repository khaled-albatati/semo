import 'package:semo/linkapi.dart';

import '../../../core/class/crud.dart';

class ProfileData{
  Crud crud;
  ProfileData(this.crud);
  getData()async{
    var response= await crud.postData(AppLink.profile, {});
   return response.fold((l) => l, (r) => r);
  }
}