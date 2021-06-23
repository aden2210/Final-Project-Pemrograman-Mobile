import 'package:flutter/material.dart';
import 'package:game_station/auth_service.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Login Page')),
        backgroundColor: Colors.blue.shade900,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: Center(
              child: new Text(
                "Selamat Datang,",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Email'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Password'),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await AuthServices.signIn(
                  emailController.text, passwordController.text);
            },
            child: Text("Sign In"),
          ),
          ElevatedButton(
              onPressed: () async {
                await AuthServices.signUp(
                    emailController.text, passwordController.text);
              },
              child: Text("Sign Up")),
        ],
      ),
    );
  }
}
