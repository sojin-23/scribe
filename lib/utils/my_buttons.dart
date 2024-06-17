import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  final double width;
  final Color? color;
  final BoxBorder? borderColor;
  const MyButtons(
      {super.key,
      required this.buttonName,
      required this.onPressed,
      required this.width,
      this.color,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 7, bottom: 7),
      width: width,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: borderColor),
      child: CupertinoButton(
          borderRadius: BorderRadius.circular(10),
          onPressed: onPressed,
          child: Text(
            buttonName,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          )),
    );
  }
}
