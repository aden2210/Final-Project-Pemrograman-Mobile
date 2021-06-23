import 'package:flutter/material.dart';
import 'package:game_station/uiapi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddProduct extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _urlController = TextEditingController();
  Future saveProduct() async {
    final response = await http
        .post(Uri.parse("http://10.0.2.2:8000/api/transaction/"), body: {
      "title": _nameController.text,
      "description": _descriptionController.text,
      "price": _priceController.text,
      "image": _descriptionController.text,
    });
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Product"),
        ),
        body: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: "Name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please fill the form";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: "Description"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please fill the form";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(labelText: "Price"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please fill the form";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _urlController,
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
                        saveProduct().then((value) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => uiApi()));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Product Has Been Added")));
                        });
                      }
                    },
                    child: Text("Save"))
              ],
            )));
  }
}
