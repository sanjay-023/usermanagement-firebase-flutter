import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usermanagement/app/modules/profile/controllers/profile_controller.dart';

class CommonCircleAvatar extends StatelessWidget {
  const CommonCircleAvatar({
    required this.radius,
    required this.size,
    Key? key,
  }) : super(key: key);

  final Size size;
  final double radius;
  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());

    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        // image: const DecorationImage(
        //   fit: BoxFit.cover,
        //   image: AssetImage(
        //     'assets/images/avatar.png',
        //   ),
        // ),
      ),
      child: profileController.userModel.imgageurl == null
          ? CircleAvatar(
              radius: radius,
              backgroundImage: AssetImage("assets/images/avatar.png"))
          : Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 10, 47, 197),
                borderRadius: BorderRadius.circular(60),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.network(profileController.userModel.imgageurl!,
                    fit: BoxFit.cover, frameBuilder:
                        (context, child, frame, wasSynchronouslyLoaded) {
                  return child;
                }, loadingBuilder: (ctx, child, loading) {
                  if (loading == null) {
                    return child;
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    );
                  }
                }),
              ),
            ),
    );
  }
}
