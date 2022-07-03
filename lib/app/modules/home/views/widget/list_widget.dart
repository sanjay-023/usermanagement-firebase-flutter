import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usermanagement/app/data/user_data_model.dart';
import 'package:usermanagement/app/modules/home/controllers/home_controller.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());

    return ListView.separated(
      itemBuilder: (context, index) {
        final dataAtIndex = homeController.userDataList[index] as UserDataModel;
        return ListTile(
          leading: CircleAvatar(),
          title: Text(
            dataAtIndex.name!,
            style: TextStyle(color: Colors.white),
          ),
          subtitle:
              Text(dataAtIndex.contact!, style: TextStyle(color: Colors.white)),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 10,
        );
      },
      itemCount: homeController.userDataList.length,
    );
  }
}
