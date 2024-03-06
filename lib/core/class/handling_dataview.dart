import 'package:flutter/material.dart';
import 'package:semo/core/class/statusrequiest.dart';
import 'package:semo/core/constant/imageassets.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequiest statusRequiest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequiest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return 
    statusRequiest == StatusRequiest.loading ?
    //  Center(child: Text("103".tr)) :
     Center(child: Lottie.asset(AppImageAssets.loading)) :

     statusRequiest == StatusRequiest.offlinefaliure ?
    //  Center(child: Text("104".tr)) :
     Center(child: Lottie.asset(AppImageAssets.noInternet)) :

     statusRequiest == StatusRequiest.serverfaliure ?
    //  Center(child: Text("105".tr)) :
     Center(child: Lottie.asset(AppImageAssets.error404,)) :
    
     statusRequiest == StatusRequiest.faliure ?
    //  Center(child: Text("106".tr)) 
     Center(child: Lottie.asset(AppImageAssets.noData,)) 

     :widget ;

  }
}
