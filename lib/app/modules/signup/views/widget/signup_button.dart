import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usermanagement/app/modules/signup/controllers/signup_controller.dart';

class SignupButton extends StatelessWidget {
  SignupButton({required this.buttonText, Key? key}) : super(key: key);
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    final signupController = Get.put(SignupController());
    return ElevatedButton(
        onPressed: () {
          signupController.signUp(signupController.signEmailController.text,
              signupController.signPasswordController.text);
        },
        child: Text(buttonText),
        style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 10, 94, 124),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            minimumSize: const Size(150, 40)));
  }
}
