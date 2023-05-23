import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

class PhoneItem {
  int? id;
  String? name;
  String? price;
  String? model;
  String? brand;
  PhoneItem() {
    id = 0;
    name = "";
    brand = "";
    model = "";
    price = "";
  }
  PhoneItem.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    price = json["price"];
    brand = json["brand"];
    model = json["model"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["price"] = price;
    data["brand"] = brand;
    data["model"] = model;
    return data;
  }
}

List<PhoneItem> phones = [];
void fetchProducts() async {
  final response = await http.get(
      Uri.parse('https://otorepair.ibmtal.com/api/index.php?api=phone_getAll'));
  phones.clear();
  if (response.statusCode == 200) {
    Map<String, dynamic> result = json.decode(response.body);
    if (result['success'] == true) {
      for (int i = 0; i < result['data'].length; i++) {
        phones.add(PhoneItem());
        phones[i].id = int.parse(result['data'][i]['id']);
        phones[i].name = result['data'][i]['name'];
        phones[i].price = result['data'][i]['price'];
        phones[i].brand = result['data'][i]['brand'];
        phones[i].model = result['data'][i]['model'];
        log(phones[i].name.toString());
      }
    }
  }
}

class PhoneList extends StatefulWidget {
  const PhoneList({super.key});

  @override
  State<PhoneList> createState() => _PhoneListState();
}

class _PhoneListState extends State<PhoneList> {
  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.builder(
        itemCount: phones.length,
        itemBuilder: (context, index) {
          return Card(
            child: ExpansionTile(
              title: Text(
                phones[index].name.toString(),
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              subtitle: Text(
                phones[index].price.toString(),
                style: TextStyle(fontSize: 16.0),
              ),
              children: [
                ListTile(
                  title: Text('ID: ${phones[index].id.toString()}'),
                  subtitle: Text('Name: ${phones[index].name.toString()}'),
                ),
                ListTile(
                  title: Text("Date Added: 16.05.2023"),
                  subtitle: Text('Price: ${phones[index].price.toString()}'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
