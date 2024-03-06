import 'package:semo/linkapi.dart';

import '../../../core/class/crud.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);
  getData(String id) async {
    var response = await crud.postData(AppLink.favorite, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
  deleteFromFav(String id) async {
    var response = await crud.postData(AppLink.deletefromfav, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
