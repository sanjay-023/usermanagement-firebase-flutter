import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usermanagement/app/modules/profile/controllers/profile_controller.dart';

class BirthdayWidget extends StatelessWidget {
  BirthdayWidget({
    Key? key,
    required this.textIcon,
    required this.detailtext,
    this.callback,
  }) : super(key: key);
  final IconData textIcon;
  final String detailtext;

  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
    profileController.birthTextController.text = detailtext;
    profileController.buttonIndex = 2;
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
              title: InkWell(
                onTap: () {
                  profileController.changeBirthTextField();
                  profileController.updateButtonIndex(2);
                  profileController.selectdate(context);
                  print(profileController.buttonIndex);
                },
                child: Text(
                  profileController.userModel.birthday == null
                      ? "Tap to add your birthday"
                      : '${profileController.selectedDate.day} ${profileController.month[profileController.selectedDate.month - 1]} ${profileController.selectedDate.year}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 105, 105, 105)),
                ),
              ),
              trailing: IconButton(
                  onPressed: () {
                    profileController.changeBirthTextField();
                    profileController.selectdate(context);
                    profileController.updateButtonIndex(2);
                    print(profileController.isBirthTextField);
                  },
                  icon: Icon(Icons.edit)));
        }),
      ),
    );
  }
}
