// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_note_app/home_page.dart';
import 'package:ios_note_app/my_buttons.dart';
import 'package:ios_note_app/my_textfileds.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(CupertinoIcons.back),
        ),
      ),
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                MyTextFields(
                  placeHolder: 'Enter your email',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 10,
                ),
                MyTextFields(
                  placeHolder: 'Enter your password',
                  suffix: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Icon(CupertinoIcons.eye),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MyButtons(
                  buttonName: 'Login',
                  onPressed: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                            child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                child: CupertinoActivityIndicator(
                                  radius: 15,
                                )));
                      },
                    );
                    Timer(Duration(seconds: 3), () {
                      Navigator.pop(context);
                      Navigator.of(context).pushAndRemoveUntil(
                          CupertinoPageRoute(
                            builder: (context) => HomePage(),
                          ),
                          (Route<dynamic> route) => false);
                    });
                  },
                  width: screenWidth,
                  color: Colors.deepPurple,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
