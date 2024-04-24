
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:waste_inspector_ai/view/screens/home_page.dart';

import '../data/static.dart';


abstract class OnBoardingController extends GetxController{
  next();
  onPageChange(int index);

}

class OnBoardingControllerImp extends OnBoardingController{
  int currentPage=0;
  late PageController  pageController;
  @override
  next() {
    currentPage++;
    if(currentPage>Static.onBoardingList.length-1){
      Static.sharedPreferences?.setString("step", "1");
      Get.offAll(HomePage());
    }else{
      pageController.animateToPage(currentPage, duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChange(int index) {
    currentPage=index;
    update();
  }

  @override
  void onInit() {
    pageController =PageController();
    super.onInit();
  }

}