import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:waste_inspector_ai/controllers/home_page_co.dart';
import 'package:waste_inspector_ai/core/class/handind_googlesea_data_view.dart';
import 'package:waste_inspector_ai/core/constant/app_colors.dart';
import 'package:waste_inspector_ai/core/constant/app_images.dart';
import 'package:waste_inspector_ai/data/models/google_seach_model.dart';

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
                                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.darkGreen),
                              ));
                        },
                        body: Container(
                          padding: const EdgeInsets.all(5),
                          child: index <= co.titles.length - 2
                              ? textBody(co.body[index].toString())
                              : HandindGoogleseaDataView(
                                  statusRequest: co.statusRequestGoogleSearch,
                                  widget: GoogleSearchPart(data: co.googleSearchItems , onTap:()=> co.onTapImageGoogleSearch(GoogleSearchModel.fromJson(co.googleSearchItems[index]).url!),)),
                        )))
              ],
            )
          ],
        );
      },
    );
  }

  Widget textBody(String body) {
    return Text(
      body,
      textAlign: TextAlign.center,
    );
  }
}

class GoogleSearchPart extends StatelessWidget {
  const GoogleSearchPart({Key? key, required this.data, this.onTap}) : super(key: key);
  final List data;
  final void Function()? onTap ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: MasonryGridView.builder(
        itemCount: data.length,
        mainAxisSpacing: 7,
        crossAxisSpacing: 7,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          GoogleSearchModel googleSearchModel = GoogleSearchModel.fromJson(data[index]);
          return SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: onTap ,
                  child: imageSearch(googleSearchModel.thumbnail!)),
                byGoogle(context),
                const SizedBox(
                  height: 3,
                ),
                titleSearch(googleSearchModel.title!, context)
              ],
            ),
          );
        },
      ),
    );
  }

  Widget imageSearch(String imageUrl) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: AppColors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(
          imageUrl,
        ),
      ),
    );
  }

  Widget byGoogle(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 17,
          width: 17,
          child: CircleAvatar(
            backgroundColor: AppColors.white,
            backgroundImage: AssetImage(AppImages.google),
          ),
        ),
        Text(
          ' By Google',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.black, height: 1.0),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }

  Widget titleSearch(String title, BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.black, fontWeight: FontWeight.bold),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
