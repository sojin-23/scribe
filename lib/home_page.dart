// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_note_app/new_note_page.dart';
import 'package:ios_note_app/splash_page.dart';

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
            padding: const EdgeInsets.all(15),
            child: Text('scribe'),
          ),
          trailing: GestureDetector(
              onTap: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) => CupertinoActionSheet(
                    actions: [
                      CupertinoActionSheetAction(
                        onPressed: () {
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
                        onPressed: () {},
                        child: Text(
                          'About us',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      CupertinoActionSheetAction(
                          onPressed: () {
                            showCupertinoDialog(
                              context: context,
                              builder: (context) => CupertinoAlertDialog(
                                title: Text('Warning'),
                                content: Text('Are you sure to sign out?'),
                                actions: [
                                  CupertinoActionSheetAction(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'No',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  CupertinoActionSheetAction(
                                    onPressed: () {
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
                                        Navigator.pop(context);
                                        Navigator.of(context)
                                            .pushReplacement(CupertinoPageRoute(
                                          builder: (context) => SplashPage(),
                                        ));
                                      });
                                    },
                                    isDestructiveAction: true,
                                    child: Text('Yes'),
                                  )
                                ],
                              ),
                            );
                          },
                          child: Text(
                            'Sign out',
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ))
                    ],
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(
                  CupertinoIcons.add,
                  color: Colors.white,
                  size: 20,
                ),
              )),
        ),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    );
                  }),
            )
          ],
        ));
  }
}
