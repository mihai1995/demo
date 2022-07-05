import 'package:demo_app/app/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controllers/home_controller.dart';

class Transactions extends GetView<HomeController> {
  const Transactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Text(
              'TRANSACTIONS',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(() => Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (var i = 0; i < controller.transactions.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${controller.transactions[i].name}',
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${controller.transactions[i].currency}${controller.transactions[i].price}',
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(dateTimeFormatter(controller.transactions[i].date)),
                                // Text('Exp: 15/02/2022 15:30')
                                Text('${controller.transactions[i].state}')
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(height: 1, color: Colors.grey)
                          ]),
                        ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
