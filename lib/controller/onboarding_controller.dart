import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semo/core/constant/routes.dart';
import 'package:semo/core/services/services.dart';
import 'package:semo/data/datasource/static/static_onboardinglist.dart';

abstract class OnBoardingController extends GetxController{
  next();
  onChangedPage(int index);
}

class OnBoardingControllerImp extends OnBoardingController{
      late PageController  pageController ;
  
  int currentpage = 0;
  MyServices myServices =Get.find();
  @override
  next() {
    currentpage++;
    if (currentpage>=onBoardingList.length){
      myServices.sharedPreferences.setString("onBoarding", "1");
        Get.offAllNamed(AppRoutes.login);
    
    }else{
    pageController.animateToPage(currentpage, duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onChangedPage(int index) {
    currentpage=index;
    update();
    
  }
  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

}