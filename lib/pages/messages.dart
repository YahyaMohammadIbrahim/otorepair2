import 'package:flutter/material.dart';
import 'package:otorepair/components/bottomBar.dart';
import 'package:otorepair/components/logo.dart';
import 'package:otorepair/components/projectname.dart';
import 'package:otorepair/contents/product/phoneList.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Logo(),
                    ProjectName(),
                  ],
                ),
              )),
          const Expanded(
            child: PhoneList(),
          ),
          BottomBar(activePage: "mesajlar".toString(), context: context)
        ],
      )),
    );
  }
}
