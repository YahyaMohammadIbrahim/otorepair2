import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:developer';

import 'package:otorepair/pages/productDetail.dart';

class ProductItem {
  int? id;
  String? name;
  String? price;
  String? photo;
  ProductItem() {
    this.id = 0;
    this.name = "";
    this.photo = "";
    this.price = "";
  }
  ProductItem.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    price = json["price"];
    photo = json["photo"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["price"] = price;
    data["photo"] = photo;
    return data;
  }
}

List<ProductItem> products = [];
void fetchProducts() async {
  final response = await http.get(Uri.parse(
      'https://otorepair.ibmtal.com/api/index.php?api=product_getAll'));
  products.clear();
  if (response.statusCode == 200) {
    Map<String, dynamic> result = json.decode(response.body);
    if (result['success'] == true) {
      for (int i = 0; i < result['data'].length; i++) {
        products.add(ProductItem());
        products[i].id = int.parse(result['data'][i]['id']);
        products[i].name = result['data'][i]['name'];
        products[i].price = result['data'][i]['price'];
        products[i].photo = result['data'][i]['photo'];
        log(products[i].name.toString());
      }
    }
  }
}

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    fetchProducts();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: products.map((item) {
          return GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProductDet(id: int.parse(item.id.toString()))));
              },
              child: Container(
                  child: Card(
                      child: ListTile(
                leading: Text(
                  item.id.toString(),
                  style: TextStyle(fontSize: 25),
                ),
                title: Text(item.name.toString()),
                subtitle: Text(item.price.toString()),
              ))));
        }).toList(),
      ),
    );
  }
}
