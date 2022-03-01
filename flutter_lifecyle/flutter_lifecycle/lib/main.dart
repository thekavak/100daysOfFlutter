import 'package:flutter/material.dart';
import 'package:flutter_lifecycle/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StatefulWidget Lifecycle ',
      home: HomePage(),
    );
  }
}
