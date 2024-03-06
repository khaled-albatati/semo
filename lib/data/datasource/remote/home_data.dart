import 'package:semo/linkapi.dart';

import '../../../core/class/crud.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getCategories() async {
    var response = await crud.postData(AppLink.categoriesHome, {});
    return response.fold((l) => l, (r) => r);
  }

  topFood() async {
    var response = await crud.postData(AppLink.restaurantLast, {});
    return response.fold((l) => l, (r) => r);
  }

  getFood()async{
     var response = await crud.postData(AppLink.restaurantHome, {});
    return response.fold((l) => l, (r) => r);

  }
  
  // searchData(String search) async {
  //   var response = await crud.postData(AppLink.searchitems, {"search": search});
  //   return response.fold((l) => l, (r) => r);
  // }


  // getOfferWomen() async {
  //   var response = await crud.postData(AppLink.offerwomen, {});
  //   return response.fold((l) => l, (r) => r);
  // }

  // getOfferMen() async {
  //   var response = await crud.postData(AppLink.offermen, {});
  //   return response.fold((l) => l, (r) => r);
  // }

  // getOfferkids() async {
  //   var response = await crud.postData(AppLink.offerkids, {});
  //   return response.fold((l) => l, (r) => r);
  // }

  // getOfferHomeAndGarden() async {
  //   var response = await crud.postData(AppLink.offerhomeandgarden, {});
  //   return response.fold((l) => l, (r) => r);
  // }

  // getOfferbeauty() async {
  //   var response = await crud.postData(AppLink.offerbeauty, {});
  //   return response.fold((l) => l, (r) => r);
  // }

  // getOfferIhome() async {
  //   var response = await crud.postData(AppLink.offerihome, {});
  //   return response.fold((l) => l, (r) => r);
  // }

  // getMen() async {
  //   var response = await crud.postData(AppLink.menhomePage, {});
  //   return response.fold((l) => l, (r) => r);
  // }

  // getWomen() async {
  //   var response = await crud.postData(AppLink.womenhomePage, {});
  //   return response.fold((l) => l, (r) => r);
  // }

  // getKids() async {
  //   var response = await crud.postData(AppLink.kidshomePage, {});
  //   return response.fold((l) => l, (r) => r);
  // }

  // getElectronic() async {
  //   var response = await crud.postData(AppLink.electronichomePage, {});
  //   return response.fold((l) => l, (r) => r);
  // }

  // getHome() async {
  //   var response = await crud.postData(AppLink.homehomePage, {});
  //   return response.fold((l) => l, (r) => r);
  // }

  // getBeauty() async {
  //   var response = await crud.postData(AppLink.beautyPage, {});
  //   return response.fold((l) => l, (r) => r);
  // }

  // getIHome() async {
  //   var response = await crud.postData(AppLink.homePage, {});
  //   return response.fold((l) => l, (r) => r);
  // }

  // getFav(String userid) async {
  //   var fav = await crud.postData(AppLink.itemsWithFavorite, {"id": userid});
  //   return fav.fold((l) => l, (r) => r);
  // }

  // getFavOnly(String userid) async {
  //   var fav = await crud.postData(AppLink.favorite, {"id": userid});
  //   return fav.fold((l) => l, (r) => r);
  // }
}
