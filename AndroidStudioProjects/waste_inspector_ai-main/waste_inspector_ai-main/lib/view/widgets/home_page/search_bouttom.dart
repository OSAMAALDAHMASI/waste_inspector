import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_inspector_ai/controllers/home_page_co.dart';
import 'package:waste_inspector_ai/core/class/statusRequesr.dart';
import 'package:waste_inspector_ai/core/constant/app_colors.dart';
import 'package:waste_inspector_ai/view/widgets/home_page/search_bouttom/part_one_loading.dart';
import 'package:waste_inspector_ai/view/widgets/home_page/search_bouttom/part_tow_show_response.dart';

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



