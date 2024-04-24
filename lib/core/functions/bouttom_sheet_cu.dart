import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_inspector_ai/core/constant/app_colors.dart';
import 'package:waste_inspector_ai/core/constant/app_strings.dart';

bouttomSheetCu(void Function()? onTapCamera, void Function()? onTapGellery) {
  Get.bottomSheet(Container(
    color: AppColors.white,
    height: 70,
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        PartBottomSheet(
          iconData: Icons.camera_outlined,
          title: AppStrings.camera,
          onTap: onTapCamera,
        ),
        PartBottomSheet(
          iconData: Icons.photo_outlined,
          title: AppStrings.gellery,
          onTap: onTapGellery,
        ),
      ],
    ),
  ));
}

class PartBottomSheet extends StatelessWidget {
  const PartBottomSheet({super.key, this.onTap, required this.iconData, required this.title});
  final void Function()? onTap;
  final IconData iconData;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(iconData),
          Text(title),
        ],
      ),
    ));
  }
}
