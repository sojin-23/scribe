// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditNotePage extends StatefulWidget {
  const EditNotePage({super.key});

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      CupertinoIcons.back,
                      color: Colors.white,
                    ),
                  ),
                  Text('Edit Note'),
                  GestureDetector(
                    onTap: () {
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
                                  child: Text('Note updated'),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Icon(
                      CupertinoIcons.check_mark,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Divider(
                height: 30,
                color: Colors.grey,
              ),
              CupertinoTextField(
                placeholder: 'Title',
                style: TextStyle(fontSize: 40),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
              ),
              CupertinoTextField(
                placeholder: 'Content',
                style: TextStyle(
                  fontSize: 20,
                ),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
