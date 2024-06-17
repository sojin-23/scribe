// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_note_app/pages/home_page.dart';
import 'package:ios_note_app/utils/my_buttons.dart';
import 'package:ios_note_app/utils/my_textfileds.dart';

class NewAccount extends StatefulWidget {
  const NewAccount({super.key});

  @override
  State<NewAccount> createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(CupertinoIcons.back),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Sign up',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              MyTextFields(
                placeHolder: 'Enter your name',
                textEditingController: nameController,
              ),
              SizedBox(
                height: 10,
              ),
              MyTextFields(
                placeHolder: 'Enter your email',
                textEditingController: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 10,
              ),
              MyTextFields(
                textEditingController: passwordController,
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
                  color: Colors.deepPurple,
                  buttonName: 'Sign up',
                  onPressed: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                            child: CupertinoActivityIndicator(
                              radius: 15,
                            ),
                          ),
                        );
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
                  width: screenWidth)
            ],
          ),
        ),
      ),
    );
  }
}
