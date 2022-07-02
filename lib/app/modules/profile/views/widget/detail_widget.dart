import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usermanagement/app/modules/profile/controllers/profile_controller.dart';

class DetailWidget extends StatelessWidget {
  DetailWidget({
    Key? key,
    required this.textIcon,
    required this.detailtext,
    required this.editStatus,
    this.callback,
  }) : super(key: key);
  final IconData textIcon;
  final String detailtext;
  final bool editStatus;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(30, 0, 0, 0),
                  blurRadius: 6,
                  spreadRadius: 0.5)
            ]),
        child: GetBuilder<ProfileController>(builder: (controller) {
          return ListTile(
            leading: Icon(textIcon, color: Color.fromARGB(255, 2, 71, 127)),
            title: Text(detailtext),
          );
        }),
      ),
    );
  }
}
