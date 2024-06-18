// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ios_note_app/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Scribe - firebase',
      theme: CupertinoThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurple,
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(fontFamily: 'Inter'),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
