import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:waste_inspector_ai/core/constant/app_images.dart';
import '../../controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    SplashScreenControllerImp controller = Get.put(SplashScreenControllerImp());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(padding: const EdgeInsets.all(30), child: Image.asset(AppImages.logo)),
          const SpinKitDualRing(
            size: 50,
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
