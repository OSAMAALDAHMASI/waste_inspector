import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:waste_inspector_ai/controllers/home_page_co.dart';
import 'package:waste_inspector_ai/core/class/statusRequesr.dart';
import 'package:waste_inspector_ai/core/constant/app_colors.dart';
import 'package:waste_inspector_ai/core/constant/app_strings.dart';

class SearchBouttom extends GetView<HomePageCoImp> {
  const SearchBouttom({super.key});

  @override
  Widget build(BuildContext context) {
    // HomePageCoImp controller =Get.put(HomePageCoImp());
    return DraggableScrollableSheet(
      initialChildSize: 0.1,
      minChildSize: 0.1,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: double.maxFinite,
          width: double.maxFinite,
          color: AppColors.white,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            child: GetBuilder<HomePageCoImp>(
              builder: (co) {
                return Column(
                  children: [
                    co.statusRequestGemaini == StatusRequest.loading
                        ? const PartOneLoding()
                        : co.statusRequestGemaini == StatusRequest.success
                            ? const PartTowShowResponse()
                            : const SizedBox()
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

//
class PartOneLoding extends StatelessWidget {
  const PartOneLoding({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [checking(), shimmerLoding()],
    );
  }

  //هذا التحميل حق الإنتظار checing
  Widget checking() {
    return SizedBox(
      width: double.maxFinite,
      height: 45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            AppStrings.checking,
            style: const TextStyle(fontSize: 16),
          ),
          const Spacer(),
          LinearProgressIndicator(
            backgroundColor: AppColors.premary.withOpacity(0.1),
            color: AppColors.premary,
          )
        ],
      ),
    );
  }

  Widget shimmerLoding() {
    return Shimmer.fromColors(
      baseColor: AppColors.baseColor,
      highlightColor: AppColors.highlightColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
              3,
              (index) => Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          partOfshimmerLoding(100, 15),
                          partOfshimmerLoding(30, 30),
                        ],
                      ),
                      partOfshimmerLoding(double.maxFinite, 15),
                      partOfshimmerLoding(double.maxFinite, 15),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              partOfshimmerLoding(100, 15),
              partOfshimmerLoding(30, 30),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                3,
                (index) => partOfshimmerLoding(90, 90),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget partOfshimmerLoding(double width, double height) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
      ),
    );
  }
}

class PartTowShowResponse extends StatelessWidget {
  const PartTowShowResponse({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageCoImp>(
      builder: (co) {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 10),
              height: 5,
              width: 70,
              decoration: BoxDecoration(color: AppColors.highlightColor, borderRadius: BorderRadius.circular(30)),
            ),
            ExpansionPanelList(
              expandIconColor: AppColors.premary,
              dividerColor: AppColors.baseColor,
              expandedHeaderPadding: const EdgeInsets.all(0),
              expansionCallback: (panelIndex, isExpanded) => co.updateExpand(panelIndex, isExpanded),
              elevation: 2,
              materialGapSize: 10,
              children: [
                ...List.generate(
                    co.titles.length,
                    (index) => ExpansionPanel(
                        isExpanded: co.titles[index].isExpanded,
                        backgroundColor: AppColors.white,
                        headerBuilder: (context, isExpanded) {
                          return Container(
                              padding: const EdgeInsets.all(10),
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                co.titles[index].title,
                                style: Theme.of(context).textTheme.titleSmall?.copyWith(color:AppColors.darkGreen ),
                              ));
                        },
                        body: Container(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            co.body[index].toString(),
                            textAlign: TextAlign.center,
                          ),
                        )))
              ],
            )
          ],
        );
      },
    );
  }
}
