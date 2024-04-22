
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          children: [
            Image.asset("${Static.onBoardingList[i].image}",height: 350,width: 250,),
            const Spacer(
              flex: 1,
            ),
            FittedBox(
              child: Text(
                "${Static.onBoardingList[i].title}",
                style: TextStyle(color: Colors.black,fontSize:screenWidth*0.08,fontWeight: FontWeight.bold ),
              ),
            ),
            const Spacer(flex: 1),
            FittedBox(
              child: Text(
                "${Static.onBoardingList[i].body}",
                style:  TextStyle(color: Colors.black,fontSize:screenWidth*0.0470,),
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
