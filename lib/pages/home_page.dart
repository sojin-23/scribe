// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:ui';
import 'package:flutter/services.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_note_app/pages/edit_note_page.dart';
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
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 0, top: 15),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => EditNotePage()));
                      },
                      onLongPress: () {
                        HapticFeedback.vibrate();
                        showCupertinoDialog(
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                            title: Text('Are you sure?'),
                            content: Text('Deleted note cannot be recovered'),
                            actions: [
                              CupertinoActionSheetAction(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              CupertinoActionSheetAction(
                                onPressed: () {
                                  Navigator.pop(context);
                                  showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) {
                                      return StatefulBuilder(
                                        builder: (context, setState) {
                                          Timer(Duration(seconds: 2), () {
                                            Navigator.pop(context);
                                          });

                                          return CupertinoPopupSurface(
                                            child: Container(
                                              padding: EdgeInsets.all(20),
                                              width: double.infinity,
                                              child: Text('Note Deleted'),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                                isDestructiveAction: true,
                                child: Text('Confirm'),
                              )
                            ],
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 25, bottom: 25),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 35, 34, 34),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                          child: Text(
                            "Note Title",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}
