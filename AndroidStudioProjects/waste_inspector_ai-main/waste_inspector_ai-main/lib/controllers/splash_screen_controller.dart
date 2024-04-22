
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:waste_inspector_ai/view/screens/home_page.dart';

abstract class SplashScreenController extends GetxController{
  goToHome();

}
class SplashScreenControllerImp extends SplashScreenController{

  String? key;
  @override
  void onInit() {
    super.onInit();
    goToHome();
  }

  @override
  goToHome()async {
    Future.delayed( const Duration(seconds:2)).then((value) async {
      Get.offAll(HomePage());

    });
  }
}