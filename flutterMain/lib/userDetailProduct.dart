import 'package:flutter/material.dart';

class userDetailProduct extends StatelessWidget {
  final Map userproduct;

  userDetailProduct({@required this.userproduct});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Product Detail"),
      ),
      body: Column(
        children: [
          Container(
            child: Image.network(userproduct['image']),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  userproduct['price'].toString(),
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(userproduct['description']),
          ),
        ],
      ),
    );
  }
}
