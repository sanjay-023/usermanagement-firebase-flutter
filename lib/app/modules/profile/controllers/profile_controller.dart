import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as fStorage;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usermanagement/app/data/user_model.dart';
import 'package:usermanagement/app/modules/login/views/login_view.dart';

class ProfileController extends GetxController {
  User? user = FirebaseAuth.instance.currentUser;

  UserModel userModel = UserModel();

  File? img;
  String? userImageUrl;
  bool? isPhoneTextField;
  bool? isBirthTextField;
  bool? buttonValue;
  final phoneTextController = TextEditingController();
  final birthTextController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  int buttonIndex = 0;

  List<String> month = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  // final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getData();

    buttonValue = false;
    isPhoneTextField = false;
    isBirthTextField = false;
  }

  void getData() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      userModel = UserModel.fromMap(value.data());
    });
    update();
  }

  void signOut() async {
    final sharedprfns = await SharedPreferences.getInstance();
    sharedprfns.clear();
    Get.offAll(LoginView());
  }

  void addPhoto() async {
    final pickImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    img = File(pickImage!.path);
    updateImage();
    print(img);
    update();
  }

  void updateImage() async {
    final fileName = DateTime.now().millisecond.toString();
    fStorage.Reference reference = fStorage.FirebaseStorage.instance
        .ref()
        .child("userimage")
        .child(fileName);
    fStorage.UploadTask uploadTask = reference.putFile(img!);
    fStorage.TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
    await taskSnapshot.ref.getDownloadURL().then((url) async {
      userImageUrl = url;
    });
    update();
    // image: const DecorationImage(
    //   fit: BoxFit.cover,
    //   image: AssetImage(
    //     'assets/images/avatar.png',
    //   ),
    // ),
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'imageurl': userImageUrl});
  }

  changePhoneTextField() {
    isPhoneTextField = true;
    buttonValue = true;
    update();
  }

  changeBirthTextField() {
    isBirthTextField = true;
    buttonValue = true;
    update();
  }

  updatePhone() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'phone': phoneTextController.text});
    update();
    print(userModel.phone);
    getData();
    print('phone updated');

    isPhoneTextField = false;
  }

  Future<void> selectdate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020, 12),
        lastDate: DateTime(2100, 01));

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      update();
    }
  }

  updateBirthday() async {
    Timestamp myTimeStamp = Timestamp.fromDate(selectedDate);
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'birthday': myTimeStamp});
    update();

    getData();
    print('birthday updated');
  }

  updateButtonIndex(int bIndex) {
    buttonIndex = bIndex;
    update();
  }
}
