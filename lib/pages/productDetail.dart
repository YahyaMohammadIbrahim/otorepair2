import 'package:flutter/material.dart';
import 'package:otorepair/components/bottomBar.dart';
import 'package:otorepair/components/logo.dart';
import 'package:otorepair/components/projectName.dart';
import 'package:otorepair/contents/product/productList.dart';
import 'package:otorepair/main.dart';

class ProductDet extends StatefulWidget {
  final int id;
  ProductDet({super.key, required this.id});
  @override
  State<ProductDet> createState() => _ProductDetState();
}

class _ProductDetState extends State<ProductDet> {
  @override
  Widget build(BuildContext context) {
    int a = 0;
    for (int i = 0; i < products.length; i++) {
      if (products[i].id == this.widget.id) a = i;
    }
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
          Expanded(
            child: Column(
              children: [
                Text(
                  products[a].name.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      border: Border.all(
                        width: 8,
                        color: Colors.yellowAccent,
                      ),
                      borderRadius: BorderRadius.circular(12)),
                  child: products[a].photo.toString().length > 10
                      ? Image.network(sImageurl + products[a].photo.toString())
                      : Text(""),
                ),
                Text(
                  products[a].price.toString() + "TL",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 48,
                      color: Color.fromARGB(255, 54, 122, 212)),
                ),
              ],
            ),
          ),
          BottomBar(activePage: "products".toString(), context: context)
        ],
      )),
    );
  }
}
