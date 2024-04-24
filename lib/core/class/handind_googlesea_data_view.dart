import 'package:flutter/material.dart';
import 'package:waste_inspector_ai/core/class/statusRequesr.dart';
import 'package:waste_inspector_ai/core/constant/app_colors.dart';

class HandindGoogleseaDataView extends StatelessWidget {
  const HandindGoogleseaDataView({super.key, required this.statusRequest, required this.widget});
  final StatusRequest statusRequest;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? loading(context)
        : statusRequest == StatusRequest.success
            ? widget
            : error(context);
  }

  loading(BuildContext context) {
    return Center(
        child: Text(
      "waite...",
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.premary),
    ));
  }

  error(BuildContext context) {
    return Center(
        child: Text(
      "Error 401\n try agin",
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.error),
    ));
  }
}
