// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_note_app/pages/login_page.dart';
import 'package:ios_note_app/utils/my_buttons.dart';
import 'package:ios_note_app/pages/new_account_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'scribe',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5,),
                    Text(
                      'your digital memory bank',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    MyButtons(
                      buttonName: 'Sign in',
                      color: Colors.deepPurple,
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(builder: (context) => LoginPage()));
                      },
                      width: screenWidth,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MyButtons(
                      buttonName: 'Sign up',
                      borderColor: Border.all(color: Colors.grey),
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(builder: (context) => NewAccount()));
                      },
                      width: screenWidth,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
