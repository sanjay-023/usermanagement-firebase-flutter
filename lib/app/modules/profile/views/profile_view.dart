import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:usermanagement/app/modules/profile/views/widget/avatar_widget.dart';
import 'package:usermanagement/app/modules/profile/views/widget/birthday_widget.dart';
import 'package:usermanagement/app/modules/profile/views/widget/detail_widget.dart';
import 'package:usermanagement/app/modules/profile/views/widget/phone_widget.dart';
import 'package:usermanagement/app/modules/profile/views/widget/signout_button.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
    profileController.onInit();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: 400,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/profilebg.jpg'))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 243, 241, 241),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 140),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    GetBuilder<ProfileController>(builder: (controller) {
                      return CommonCircleAvatar(
                        radius: 60,
                        size: Size(120, 120),
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.only(top: 80, left: 80),
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        child: IconButton(
                            onPressed: () {
                              profileController.addPhoto();
                            },
                            icon: Icon(Icons.add_a_photo, color: Colors.white)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 270),
            child: GetBuilder<ProfileController>(builder: (controller) {
              return SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${profileController.userModel.name}",
                      style: TextStyle(
                          color: Color.fromARGB(255, 66, 65, 65),
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DetailWidget(
                      textIcon: Icons.email,
                      detailtext: profileController.userModel.email!,
                      editStatus: false,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PhoneWidget(
                        textIcon: Icons.phone,
                        detailtext: profileController.userModel.phone!),
                    SizedBox(
                      height: 10,
                    ),
                    BirthdayWidget(
                        textIcon: Icons.calendar_month,
                        detailtext: "Add Your Birthday"),
                    SizedBox(
                      height: 15,
                    ),
                    SignoutButton()
                  ],
                ),
              );
            }),
          ),
          SafeArea(
              child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ))
        ],
      ),
    );
  }
}
