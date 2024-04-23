
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waste_inspector_ai/data/static.dart';
import 'package:waste_inspector_ai/view/screens/home_page.dart';
import 'package:waste_inspector_ai/view/screens/onboarding.dart';

abstract class SplashScreenController extends GetxController{
  goToHome();

}
class SplashScreenControllerImp extends SplashScreenController{

  String? key;
  @override
  void onInit() async{
    super.onInit();
    Static.sharedPreferences = await SharedPreferences.getInstance();
    goToHome();
  }

  @override
  goToHome()async {
    Future.delayed( const Duration(seconds:2)).then((value) async {
      if(Static.sharedPreferences?.getString("step")=="1"){
        Get.offAll( HomePage());
      }
      else{
        Get.offAll(const OnBoarding());
      }


    });
  }
}