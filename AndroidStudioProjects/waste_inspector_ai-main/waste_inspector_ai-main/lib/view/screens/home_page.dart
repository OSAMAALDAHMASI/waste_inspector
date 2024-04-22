import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_inspector_ai/controllers/home_page_co.dart';
import 'package:waste_inspector_ai/core/constant/app_colors.dart';
import 'package:waste_inspector_ai/core/functions/bouttom_sheet_cu.dart';
import 'package:waste_inspector_ai/data/static.dart';
import 'package:waste_inspector_ai/view/widgets/home_page/back_ground_image.dart';
import 'package:waste_inspector_ai/view/widgets/home_page/search_bouttom.dart';
import 'package:waste_inspector_ai/view/widgets/home_page/upload_image_de.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomePageCoImp homePageCoImp = Get.put(HomePageCoImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: const Text("Waste Inspector Ai"),
          leading: GetBuilder<HomePageCoImp>(
            builder: (co) {
              return AnimatedCrossFade(
                  firstChild: const SizedBox(),
                  secondChild:
                      IconButton(onPressed: () => co.onBack(), icon: const Icon(Icons.arrow_back_ios_outlined)),
                  crossFadeState: co.isSearch == false ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 700));
            },
          ),
          backgroundColor: AppColors.white,
          centerTitle: true,
        ),
        body: GetBuilder<HomePageCoImp>(builder: (co) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            child: co.isSearch == false
                ? HomePartOne(
                    co: co,
                    key: const ValueKey(1),
                  )
                : HomePartTow(
                    co: co,
                    key: const ValueKey(2),
                  ),
          );
        }));
  }
}

class HomePartOne extends StatelessWidget {
  const HomePartOne({super.key, required this.co});
  final HomePageCoImp co;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(65.0),
      child: Column(
        children: [
          UploadImageDe(
            myFile: co.myFile,
            onTap: () => bouttomSheetCu(() => co.onTapCamera(), () => co.onTapGellery()),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(onPressed: () {
            co.myFile != null ? co.ontapSearch(co.myFile! , Static.prompt) : null ;
          } , child: const Text("Search")),
        ],
      ),
    );
  }
}

class HomePartTow extends StatelessWidget {
  const HomePartTow({super.key, required this.co});
  final HomePageCoImp co;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [BackGroundImage(file: co.myFile!), const SearchBouttom()],
      ),
    );
  }
}
