import 'package:demo_app/app/modules/home/views/widgets/extra_button.dart';
import 'package:demo_app/app/modules/home/views/widgets/history.dart';
import 'package:demo_app/app/modules/home/views/widgets/package.dart';
import 'package:demo_app/app/modules/home/views/widgets/your_plan.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: const [
        YourPlan(),
        Packages(),
        ExtraButton(),
        Transactions(),
      ])),
    );
  }
}
