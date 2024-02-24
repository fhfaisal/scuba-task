import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scuba_faisal/app/modules/home/bindings/home_binding.dart';
import 'package:scuba_faisal/app/utils/utils.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      theme: ThemeData(
        scaffoldBackgroundColor: blueClr.withOpacity(0.4),
        appBarTheme: AppBarTheme(centerTitle: true,color: blueClr,titleTextStyle: TextStyle(color: Colors.white))
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
