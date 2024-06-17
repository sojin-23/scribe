// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';

class MyTextFields extends StatelessWidget {
  final String placeHolder;
  final TextInputType? keyboardType;
  final Widget? suffix;
  const MyTextFields({super.key, required this.placeHolder, this.keyboardType, this.suffix});

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      suffix: suffix,
      keyboardType: keyboardType,
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 15),
      placeholder: placeHolder,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 35, 34, 34),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
