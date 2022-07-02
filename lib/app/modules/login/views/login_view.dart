import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:usermanagement/app/modules/login/views/widget/button_widget.dart';
import 'package:usermanagement/app/modules/login/views/widget/text_box_widget.dart';
import 'package:usermanagement/app/modules/signup/views/signup_view.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      body: Stack(
        children: [
          ClipRRect(
            child: Container(
              height: double.infinity,

              // color: Colors.red,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/clipimage5.jpg"),
                      fit: BoxFit.cover)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 44,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Back !",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: 200,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextBoxWidget(
                              hintText: 'Enter User Name',
                              hintIcon: Icons.mail,
                              textController:
                                  loginController.logEmailController),
                          SizedBox(
                            height: 15,
                          ),
                          TextBoxWidget(
                            hintText: 'Enter password',
                            hintIcon: Icons.lock,
                            textController:
                                loginController.logPasswordcontroller,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SubmitButton(buttonText: "Log in"),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "New here ?",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Get.to(SignupView());
                                  },
                                  child: Text("Signup"))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/googleLogo.png',
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/facebooklogo.png',
                                  height: 20,
                                  width: 20,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
