import 'package:demo_app/app/data/package.dart';
import 'package:demo_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Packages extends GetView<HomeController> {
  const Packages({Key? key}) : super(key: key);
  static final List<PackageModel> packages = [
    PackageModel(name: 'BASIC', price: 230, currency: '\$', coins: 10),
    PackageModel(name: 'BUSINESS', price: 330, currency: '\$', coins: 15),
    PackageModel(name: 'PRO', price: 420, currency: '\$', coins: 20),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      for (var i = 0; i < packages.length; i++)
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: packages[i].name == 'BUSINESS' ? Colors.grey : Colors.black,
            ),
            child: InkWell(
              onTap: () {
                controller.buyPlan(packages[i]);
              },
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${packages[i].name} - ${packages[i].currency}${packages[i].price}',
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${packages[i].coins} coins',
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            )),
    ]);
  }
}
