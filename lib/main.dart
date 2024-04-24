import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_inspector_ai/theme/app_theme.dart';
import 'package:waste_inspector_ai/view/screens/splash_screen.dart';

import 'bindings/intialbinding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme() ,
      initialBinding: InitialBinding(),
      initialRoute: '/',
      getPages: [GetPage(name: '/', page: () => const SplashScreen())],
    );
  }
}

