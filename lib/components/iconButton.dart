import 'package:flutter/material.dart';

Widget bottomButton({
  required IconData iconData,
  required bool active,
  String? metin,
  Widget? widget,
  BuildContext? context,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.pushReplacement(
          context!, MaterialPageRoute(builder: (context) => widget!));
    },
    child: Icon(
      iconData,
      size: 20,
      color: Color(active ? 0xFF0001FC : 0xFF0A1034),
    ),
  );
}
