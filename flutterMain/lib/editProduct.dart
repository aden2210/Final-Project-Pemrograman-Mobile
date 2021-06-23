import 'package:flutter/material.dart';
import 'package:game_station/uiapi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditProduct extends StatelessWidget {
  final Map product;
  EditProduct({@required this.product});
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _urlController = TextEditingController();
  Future updateProduct() async {
    final response = await http.put(
        Uri.parse(
            'http://10.0.2.2:8000/api/transaction/' + product['id'].toString()),
        body: {
          "title": _nameController.text,
          "description": _descriptionController.text,
          "price": _priceController.text,
          "image": _urlController.text,
        });
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Product"),
        ),
        body: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController..text = product['title'],
                  decoration: InputDecoration(labelText: "Name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please fill the form";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _descriptionController
                    ..text = product['description'],
                  decoration: InputDecoration(labelText: "Description"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please fill the form";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _priceController
                    ..text = product['price'].toString(),
                  decoration: InputDecoration(labelText: "Price"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please fill the form";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _urlController..text = product['image'],
                  decoration: InputDecoration(labelText: "Image URL"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please fill the form";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        updateProduct().then((value) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => uiApi()));
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Product Update")));
                        });
                      }
                    },
                    child: Text("Save"))
              ],
            )));
  }
}
