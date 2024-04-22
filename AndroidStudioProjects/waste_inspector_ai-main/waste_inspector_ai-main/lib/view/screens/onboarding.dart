
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../../controllers/onBoarding_controller.dart';
import '../widgets/onBoarding/customButton.dart';
import '../widgets/onBoarding/customslider.dart';
import '../widgets/onBoarding/dotController.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(OnBoardingControllerImp());
    return  Scaffold(
        // backgroundColor: AppColor.white,
        body: SafeArea(

          child: Column(
            children: [
             
              const Expanded(
                flex: 6,
                child: CustomSliderOnBoarding(),
              ),
              const Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Spacer(),
                      CustomDotControllerOnBoarding(),
                      Spacer(),
                      CustomButtonOnBoarding()
                    ],
                  ))
            ],
          ),
        ));
  }
}
