import 'package:flutter/material.dart';
import 'package:game_station/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:game_station/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.firebaseUserStream,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
