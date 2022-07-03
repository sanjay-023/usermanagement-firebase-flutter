import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:usermanagement/app/modules/home/views/widget/list_widget.dart';
import 'package:usermanagement/app/modules/home/views/widget/shimmer_widget.dart';
import 'package:usermanagement/app/modules/profile/controllers/profile_controller.dart';
import 'package:usermanagement/app/modules/profile/views/profile_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());

    final profileController = Get.put(ProfileController());
    profileController.onInit();
    homeController.onInit();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 23, 42),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(ProfileView());
              },
              icon: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 15,
                  child: Icon(Icons.person),
                ),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homeController.addDataPopup();
        },
        child: Icon(Icons.add),
      ),
      body: GetBuilder<HomeController>(builder: (controller) {
        return homeController.userDataList.isEmpty
            ? ShimmerWidget()
            : ListWidget();
      }),
    );
  }
}
