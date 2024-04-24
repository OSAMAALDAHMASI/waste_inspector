import 'dart:io';

import 'package:flutter/material.dart';

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
                : DecorationImage(scale: 2,
                image: AssetImage("assets/images/4.png"),
                ),
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(style: BorderStyle.solid,color: Colors.green)),
        child: Center(
          child: Text(""),
        ),
      ),
    );
  }
}
