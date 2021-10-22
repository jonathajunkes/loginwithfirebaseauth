import 'package:flutter/material.dart';
import 'package:loginwithfirebaseauth/telas/customagenda.dart';
import 'package:loginwithfirebaseauth/telas/teste.dart';
import 'telas/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterFire Samples',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.dark,
      ),
      home: CustomAgenda(),//HomePage(title: "Teste v1",),
    );
  }
}