import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(child: Text('ABOUT US')),
      ),
      body: Container(
        child: ListView(
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1))
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/appimages/bg.jpg'))),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Text(
                'Game Station dibuat berdasarkan minat kepada game yang terus meningkat, sehingga dibuatnya aplikasi mobile ini bertujuan untuk memperluas jangkauan Game Station kami kepada pengguna')
          ],
        ),
      ),
    );
  }
}
