import 'package:demo_app/app/services/sqllite.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SqlLite.inst.init();
  runApp(
    GetMaterialApp(
      title: 'DemoApp',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
