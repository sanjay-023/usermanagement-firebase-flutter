import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usermanagement/app/data/user_model.dart';
import 'package:usermanagement/app/modules/home/views/home_view.dart';
import 'package:usermanagement/main.dart';

class SignupController extends GetxController {
  // //TODO: Implement SignupController

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

  final signNameController = TextEditingController();
  final signEmailController = TextEditingController();
  final signPhoneController = TextEditingController();
  final signPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final auth = FirebaseAuth.instance;

  void signUp(String email, String password) async {
    if (signEmailController.text.isEmpty ||
        signNameController.text.isEmpty ||
        signPhoneController.text.isEmpty ||
        signPasswordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      Get.snackbar("Signup Failed", "required field is empty");
    } else {
      if (signPasswordController.text.length < 6) {
        Get.snackbar(
            "Week Password", "Password must contain more than 6 charecters");
      } else if (signPasswordController.text !=
          confirmPasswordController.text) {
        Get.snackbar("Failed", "Password does not match");
      } else if (signPhoneController.text.length != 10) {
        Get.snackbar(
            "Incorrect Phone Number", "Please enter a valid phone number");
      } else {
        final sharedprfns = await SharedPreferences.getInstance();
        await sharedprfns.setBool(SAVE_KEY, true);
        await auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFireStore()})
            .catchError((e) {
          Get.snackbar("", "${e.message}");
        });
      }
    }
  }

  postDetailsToFireStore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = signNameController.text;
    userModel.phone = signPhoneController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Get.offAll(HomeView());
  }
}
