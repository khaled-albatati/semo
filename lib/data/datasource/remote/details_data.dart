import 'package:semo/linkapi.dart';

import '../../../core/class/crud.dart';

class ItemsDataDetails{
  Crud crud;
  ItemsDataDetails(this.crud);
  getData(String id)async{
    var response= await crud.postData(AppLink.itemsDetails, {"id":id.toString()});
   return response.fold((l) => l, (r) => r);
  }
}