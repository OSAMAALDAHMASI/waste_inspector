
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_inspector_ai/core/constant/app_colors.dart';
import 'package:waste_inspector_ai/data/static.dart';

import '../../../controllers/onBoarding_controller.dart';


class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
            Static.onBoardingList.length,
            (index) => GetBuilder<OnBoardingControllerImp>(
                builder: (controller) => AnimatedContainer(
                      margin: const EdgeInsets.only(right: 5),
                      duration: const Duration(milliseconds: 900),
                      width: controller.currentPage == index ? 20 : 5,
                      height: 6,
                      decoration: BoxDecoration(
                          color: AppColors.premary,
                          borderRadius: BorderRadius.circular(10)),
                    )))
      ],
    );
  }
}
