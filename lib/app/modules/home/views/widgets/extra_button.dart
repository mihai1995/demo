import 'package:demo_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ExtraButton extends GetView<HomeController> {
  const ExtraButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white, border: Border.all(color: Colors.black)),
      child: InkWell(
        onTap: () {
          controller.buyExtra();
        },
        child: Column(children: const [
          SizedBox(
            height: 15,
          ),
          Text(
            'BUY EXTRA COINS',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          )
        ]),
      ),
    );
  }
}
