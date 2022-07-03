import 'package:flutter/material.dart';

class AllDataWidget extends StatelessWidget {
  AllDataWidget({Key? key, required this.hText, required this.textController})
      : super(key: key);
  final String hText;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 253, 226, 186),
          borderRadius: BorderRadius.circular(30)),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: textController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(5),
          hintText: hText,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
        ),
      ),
    );
  }
}
