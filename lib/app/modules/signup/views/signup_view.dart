import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:usermanagement/app/modules/login/views/widget/text_box_widget.dart';
import 'package:usermanagement/app/modules/signup/views/widget/signup_button.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    final signupController = Get.put(SignupController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/clipimage5.jpg',
                    ))),
          ),
          SafeArea(
              child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon:
                          Icon(Icons.arrow_back_ios_new, color: Colors.white)),
                ],
              ),
              SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 36,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Create an account',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 90,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextBoxWidget(
                                hintText: "Enter Name",
                                hintIcon: Icons.person,
                                textController:
                                    signupController.signNameController),
                            SizedBox(
                              height: 15,
                            ),
                            TextBoxWidget(
                                hintText: "Enter Email",
                                hintIcon: Icons.mail_rounded,
                                textController:
                                    signupController.signEmailController),
                            SizedBox(
                              height: 15,
                            ),
                            TextBoxWidget(
                                hintText: "Enter Phone Number",
                                hintIcon: Icons.phone,
                                textController:
                                    signupController.signPhoneController),
                            SizedBox(height: 15),
                            TextBoxWidget(
                                hintText: "Enter New Password",
                                hintIcon: Icons.lock,
                                textController:
                                    signupController.signPasswordController),
                            SizedBox(
                              height: 15,
                            ),
                            TextBoxWidget(
                                hintText: "Confirm Password",
                                hintIcon: Icons.lock,
                                textController:
                                    signupController.confirmPasswordController),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SignupButton(
                              buttonText: "Sign up",
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
