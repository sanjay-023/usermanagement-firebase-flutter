import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usermanagement/app/data/user_model.dart';

class HomeController extends GetxController {
  UserModel allUsers = UserModel();

  // final count = 0.obs;

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {}
  // void increment() => count.value++;

  // void getAllUsers() async {
  //   var usersnapshot =
  //       FirebaseFirestore.instance.collection("users").snapshots();
  //   update();
  //   print(usersnapshot.);
  // }
}
