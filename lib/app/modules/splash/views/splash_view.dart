import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    final splashController = Get.put(SplashController());
    splashController.onInit();
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Color.fromARGB(255, 0, 64, 255),
          Color.fromARGB(255, 15, 92, 245),
          Color.fromARGB(255, 37, 66, 253)
        ])),
        // child: Image.asset(
        //   'asset/images/studentapp-logo.png',
        //   width: 50,
        //   height: 50,
        // ),
      ),
    );
  }
}
