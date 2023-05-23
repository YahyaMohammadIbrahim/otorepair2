import 'package:flutter/material.dart';
import 'package:otorepair/main.dart';
import 'package:otorepair/pages/messages.dart';
import 'package:otorepair/pages/products.dart';

import 'package:otorepair/pages/profile.dart';
import 'iconButton.dart';

Widget BottomBar({String? activePage, BuildContext? context}) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: const Offset(0, -3),
          color: Colors.black.withOpacity(0.25),
          blurRadius: 10,
        )
      ], color: const Color.fromARGB(255, 255, 255, 255)),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          bottomButton(
              iconData: Icons.home,
              active: activePage == "" ? true : false,
              widget: const Anasayfa(),
              metin: "Anasayfa",
              context: context),
          bottomButton(
              iconData: Icons.phone_android,
              active: activePage == "mesajlar" ? true : false,
              widget: const Messages(),
              metin: "Profil",
              context: context),
          bottomButton(
              iconData: Icons.person,
              active: activePage == "profile" ? true : false,
              widget: const Profiles(),
              metin: "Profil",
              context: context),
          bottomButton(
              iconData: Icons.car_repair,
              active: activePage == "products" ? true : false,
              widget: const Products(),
              metin: "Reels",
              context: context)
        ],
      ),
    ),
  );
}
