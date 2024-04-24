
import 'package:get/get.dart';
import 'package:waste_inspector_ai/controllers/home_page_co.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomePageCoImp());
  }

}