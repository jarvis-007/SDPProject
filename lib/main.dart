import 'package:flutter/material.dart';
import 'package:demo_flutter2/service/authentication.dart';
import 'package:demo_flutter2/pages/root_page.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'car pooling',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: new RootPage(auth: new Auth()));
  }
}