
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_inspector_ai/core/constant/app_colors.dart';

import '../../../controllers/onBoarding_controller.dart';
import '../../../data/static.dart';


class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        print(val);
        controller.onPageChange(val);
      },
      itemCount: Static.onBoardingList.length,
      itemBuilder: (BuildContext context, int i) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("${Static.onBoardingList[i].image}",height: 350,width: 250,),

            FittedBox(
              child: Text(
                "${Static.onBoardingList[i].title }",textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.premary,fontSize:screenWidth*0.08,fontWeight: FontWeight.bold ),
              ),
            ),
            FittedBox(
              child: Text(
                "${Static.onBoardingList[i].body}",
                style:  TextStyle(color: Color(0xff12220A),fontSize:screenWidth*0.0470,),
                textAlign: TextAlign.center,
              ),
            ),
            // const Spacer(
            //   flex: 3,
            // ),
          ],
        );
      },
    );
  }
}
