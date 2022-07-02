import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usermanagement/app/modules/login/controllers/login_controller.dart';

class SubmitButton extends StatelessWidget {
  SubmitButton({required this.buttonText, Key? key}) : super(key: key);
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return ElevatedButton(
        onPressed: () {
          loginController.logIn(loginController.logEmailController.text,
              loginController.logPasswordcontroller.text);
        },
        child: Text(buttonText),
        style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 10, 94, 124),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            minimumSize: const Size(150, 40)));
  }
}
