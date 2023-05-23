import 'package:flutter/material.dart';
import 'package:otorepair/components/bottomBar.dart';
import 'package:otorepair/components/logo.dart';
import 'package:otorepair/components/projectname.dart';
import 'package:otorepair/contents/product/productList.dart';

import 'dart:io';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

String sImageurl = 'https://otorepair.ibmtal.com/uploads/images/smallimage/';
String bigImageurl = 'https://otorepair.ibmtal.com/uploads/images/bigimage/';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'OtoRepair',
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
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
          const Expanded(child: ProductList()),
          BottomBar(activePage: "".toString(), context: context)
        ],
      )),
    );
  }
}
