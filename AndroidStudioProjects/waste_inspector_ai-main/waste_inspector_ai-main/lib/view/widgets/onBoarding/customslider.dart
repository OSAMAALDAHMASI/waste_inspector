import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/onBoarding_controller.dart';
import '../../../data/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChange(val);
      },
      itemCount: Static.onBoardingList.length,
      itemBuilder: (BuildContext context, int i) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "${Static.onBoardingList[i].image}",
              height: 250,
              width: double.maxFinite,
            ),
            i > 1
                ? SizedBox(
                    height: 20,
                  )
                : SizedBox(),
            FittedBox(
              child: Text(
                "${Static.onBoardingList[i].title}",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            FittedBox(
              child: Text(
                "${Static.onBoardingList[i].body}",
                style: Theme.of(context).textTheme.bodyLarge,
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
