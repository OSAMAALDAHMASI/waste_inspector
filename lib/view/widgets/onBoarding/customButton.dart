import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_inspector_ai/core/constant/app_colors.dart';

import '../../../controllers/onBoarding_controller.dart';


class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(margin: const EdgeInsets.only(bottom: 30),height: 40,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 0),
        textColor: Colors.white,
        onPressed: () {
          controller.next();
        },color: AppColors.premary,
        child:  const Text("Continue"),
      ),

    );
  }
}
