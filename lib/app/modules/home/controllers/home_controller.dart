import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usermanagement/app/data/user_data_model.dart';
import 'package:usermanagement/app/modules/home/views/widget/add_data.dart';

class HomeController extends GetxController {
  final phoneTextController = TextEditingController();
  final nameTextController = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;

  UserDataModel userDataModel = UserDataModel();
  List<Object> userDataList = [];

  // final count = 0.obs;

  // @override
  // void onReady() {
  //   super.onReady();
  // }
  @override
  void onInit() {
    super.onInit();
    getUserData();
  }

  // @override
  // void onClose() {}
  // void increment() => count.value++;

  // void getAllUsers() async {
  //   var usersnapshot =
  //       FirebaseFirestore.instance.collection("users").snapshots();
  //   update();
  //   print(usersnapshot.);
  // }

  addUserData() async {
    UserDataModel allUsers = UserDataModel();

    final auth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    allUsers.dataid = user!.uid;
    allUsers.name = nameTextController.text;
    allUsers.contact = phoneTextController.text;

    await firebaseFirestore
        .collection("users/${user.uid}/Userdata")
        .doc()
        .set(allUsers.toMap());
  }

  addDataPopup() {
    Get.defaultDialog(
        title: "Add contact",
        titlePadding: EdgeInsets.all(20),
        contentPadding: EdgeInsets.all(20),
        content: Column(
          children: [
            AllDataWidget(
                hText: "Enter contact name",
                textController: nameTextController),
            SizedBox(
              height: 20,
            ),
            AllDataWidget(
              hText: "Enter contact number",
              textController: phoneTextController,
            )
          ],
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                addUserData();
                nameTextController.clear();
                phoneTextController.clear();
                Get.back();
              },
              child: Text("Add")),
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Cancel"))
        ]);
  }

  getUserData() async {
    final auth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    final uid = user!.uid;
    var userData = await firebaseFirestore
        .collection('users')
        .doc(uid)
        .collection('Userdata')
        .get();

    userDataList =
        List.from(userData.docs.map((doc) => UserDataModel.fromSnapshot(doc)));
    update();
    print(userDataList);
  }
}
