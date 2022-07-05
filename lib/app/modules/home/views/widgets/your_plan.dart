import 'package:demo_app/app/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controllers/home_controller.dart';

class YourPlan extends GetView<HomeController> {
  const YourPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        child: Obx(
          () => Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Your plan',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'COINS: ${controller.activePlan.value.coins}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(controller.activePlan.value.name), Text('Exp: ${dateTimeFormatter(controller.activePlan.value.expireDate)}')],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(height: 1, color: Colors.grey)
          ]),
        ));
  }
}
