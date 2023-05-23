import 'package:flutter/material.dart';
import 'package:otorepair/components/bottomBar.dart';
import 'package:otorepair/components/logo.dart';
import 'package:otorepair/components/projectname.dart';
import 'package:otorepair/contents/product/productList.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
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
            child: ProductList(),
          ),
          BottomBar(activePage: "products".toString(), context: context)
        ],
      )),
    );
  }
}
