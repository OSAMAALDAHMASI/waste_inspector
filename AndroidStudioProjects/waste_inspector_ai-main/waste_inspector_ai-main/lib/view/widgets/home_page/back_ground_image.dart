import 'dart:io';

import 'package:flutter/material.dart';

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({super.key, required this.file});
  final File file;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Image.file(
          file,
          fit: BoxFit.cover,
        ));
  }
}
