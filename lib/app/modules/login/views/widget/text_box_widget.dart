import 'package:flutter/material.dart';

class TextBoxWidget extends StatelessWidget {
  TextBoxWidget(
      {required this.hintText,
      required this.hintIcon,
      Key? key,
      required this.textController})
      : super(key: key);
  final String hintText;
  final IconData hintIcon;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      decoration: BoxDecoration(
          color: Color.fromARGB(82, 111, 179, 251),
          borderRadius: BorderRadius.circular(30)),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
            // contentPadding: EdgeInsets.all(5),
            hintText: hintText,
            hintStyle: TextStyle(color: Color.fromARGB(128, 255, 254, 254)),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            prefixIcon: Icon(hintIcon)),
        obscureText: hintText == 'Enter password' ||
                hintText == 'Enter New Password' ||
                hintText == 'Confirm Password'
            ? true
            : false,
      ),
    );
  }
}
