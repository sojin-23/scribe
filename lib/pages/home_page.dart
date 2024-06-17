// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_note_app/pages/new_note_page.dart';
import 'package:ios_note_app/pages/splash_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.black,
      navigationBar: CupertinoNavigationBar(
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            'scribe',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        trailing: GestureDetector(
          onTap: () {
            showCupertinoModalPopup(
              context: context,
              builder: (context) => CupertinoActionSheet(
                actions: [
                  CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.pop(context); // Dismiss the action sheet
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => NewNotePage(),
                        ),
                      );
                    },
                    child: Text(
                      'Create new note',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.pop(context); // Dismiss the action sheet
                      // Implement the about us page navigation or dialog
                      showCupertinoDialog(
                        context: context,
                        builder: (context) => CupertinoAlertDialog(
                          title: Text('About Us'),
                          content: Text(
                              "I'm Sojin, and I'm a Flutter developer. I build efficient mobile apps for both iOS and Android."),
                          actions: [
                            CupertinoDialogAction(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Close',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text(
                      'About us',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.pop(context); // Dismiss the action sheet
                      showCupertinoDialog(
                        context: context,
                        builder: (context) => CupertinoAlertDialog(
                          title: Text('Warning'),
                          content: Text('Are you sure to sign out?'),
                          actions: [
                            CupertinoDialogAction(
                              onPressed: () {
                                Navigator.pop(context); // Dismiss the dialog
                              },
                              child: Text(
                                'No',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            CupertinoDialogAction(
                              onPressed: () {
                                // Navigator.pop(context); // Dismiss the dialog
                                showCupertinoDialog(
                                  context: context,
                                  builder: (context) => Center(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 2, sigmaY: 2),
                                      child: CupertinoActivityIndicator(
                                        radius: 15,
                                      ),
                                    ),
                                  ),
                                );
                                Timer(Duration(seconds: 3), () {
                                  Navigator.pop(
                                      context); // Remove activity indicator
                                  Navigator.of(context).pushReplacement(
                                    CupertinoPageRoute(
                                      builder: (context) => SplashPage(),
                                    ),
                                  );
                                });
                              },
                              isDestructiveAction: true,
                              child: Text('Yes'),
                            ),
                          ],
                        ),
                      );
                    },
                    isDestructiveAction: true,
                    child: Text(
                      'Sign out',
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ),
                ],
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5, right: 10),
            child: Icon(
              CupertinoIcons.add,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: 10,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 35, 34, 34),
                        border: Border.all(color: Colors.grey)),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            'Title note',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Divider(color: Colors.grey,),
                          Text(
                              "Here is a paragraph describing the different types of precipitation besides rain:In addition to the familiar form of liquid precipitation known as rain, there are several other types of precipitation that can occur in the Earth's atmosphere. One common type is snow, which forms when water vapor condenses directly into ice crystals that fall to the ground. Sleet is another precipitation type, consisting of small, translucent ice pellets that result when raindrops pass through a layer of cold air near the surface and freeze. Hail is a more dramatic form of solid precipitation, comprising balls or irregular lumps of ice that grow in size as they are repeatedly lifted up and down in the turbulent updrafts of thunderstorms. Finally, freezing rain occurs when liquid raindrops fall through a sub-freezing layer of air near the ground, causing them to freeze on contact with surfaces and creating a dangerous coating of ice. Though less familiar than the ubiquitous rain, these other forms of precipitation play important roles in Earth's weather and climate patterns, with each type forming under distinct atmospheric conditions.")
                        ],
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
