import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usermanagement/app/modules/home/views/home_view.dart';
import 'package:usermanagement/main.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  // final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {}
  // void increment() => count.value++;

  final logEmailController = TextEditingController();
  final logPasswordcontroller = TextEditingController();
  final auth = FirebaseAuth.instance;

  void logIn(String email, String password) async {
    final sharedprfns = await SharedPreferences.getInstance();
    await sharedprfns.setBool(SAVE_KEY, true);

    await auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then(
          (uid) => {
            Fluttertoast.showToast(msg: "Login successfull"),
            Get.offAll(HomeView())
          },
        )
        .catchError((e) {
      return errorSnack(e.message);
    });
  }

  errorSnack(errorMessage) {
    return Get.snackbar("", "",
        messageText: Text(errorMessage),
        titleText: Text(
          "Login Failed",
          style:
              TextStyle(color: Color.fromARGB(255, 253, 25, 8), fontSize: 18),
        ));
  }
}
