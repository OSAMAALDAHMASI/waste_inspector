import 'dart:io';

import 'package:flutter/material.dart';
import 'package:waste_inspector_ai/core/constant/app_strings.dart';

class UploadImageDe extends StatelessWidget {
  const UploadImageDe({super.key, this.onTap, this.myFile});
  final void Function()? onTap;
  final File? myFile;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 300,
        decoration: BoxDecoration(
            image: myFile != null
                ? DecorationImage(
                    image: FileImage(
                      myFile!,
                    ),
                    fit: BoxFit.cover)
                : null,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(style: BorderStyle.solid)),
        child: Center(
          child: Text(myFile != null ? "" : AppStrings.uploadImage),
        ),
      ),
    );
  }
}
