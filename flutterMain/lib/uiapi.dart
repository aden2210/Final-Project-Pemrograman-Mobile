import 'package:flutter/material.dart';
import 'package:game_station/product_detail_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:game_station/addProduct.dart';
import 'package:game_station/editProduct.dart';

class uiApi extends StatefulWidget {
  @override
  _uiApiState createState() => _uiApiState();
}

class _uiApiState extends State<uiApi> {
  final String url = 'http://10.0.2.2:8000/api/transaction/';

  Future getTransaction() async {
    var response = await http.get(Uri.parse(url));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  Future deleteProduct(String productId) async {
    String url = 'http://10.0.2.2:8000/api/transaction/' + productId;

    var response = await http.delete(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddProduct();
          }));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Padding(
          padding: const EdgeInsets.only(left: 110),
          child: Text('SHOP'),
        ),
      ),
      body: FutureBuilder(
          future: getTransaction(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data['data'].length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 180,
                      child: Card(
                        elevation: 5,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductDetail(
                                              product: snapshot.data['data']
                                                  [index],
                                            )));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0)),
                                height: 120,
                                width: 120,
                                child: Image.network(
                                    snapshot.data['data'][index]['image'],
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        snapshot.data['data'][index]['title'],
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(snapshot.data['data'][index]
                                            ['description'])),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder:
                                                              (context) =>
                                                                  EditProduct(
                                                                    product: snapshot
                                                                            .data['data']
                                                                        [index],
                                                                  )));
                                                },
                                                child: Icon(Icons.mode_edit)),
                                            GestureDetector(
                                                onTap: () {
                                                  deleteProduct(snapshot
                                                          .data['data'][index]
                                                              ['id']
                                                          .toString())
                                                      .then((value) {
                                                    setState(() {});
                                                    ;
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            content: Text(
                                                                "Product Deleted")));
                                                  });
                                                },
                                                child: Icon(Icons.delete)),
                                          ],
                                        ),
                                        Text(snapshot.data['data'][index]
                                                ['price']
                                            .toString()),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Text('');
            }
          }),
    );
  }
}
