import 'package:semo/linkapi.dart';

import '../../../core/class/crud.dart';

class CategoriesData{
  Crud crud;
  CategoriesData(this.crud);
  getData()async{
    var response= await crud.postData(AppLink.homePage, {});
   return response.fold((l) => l, (r) => r);
  }
}