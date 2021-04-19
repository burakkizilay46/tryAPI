import 'package:flutter/material.dart';
import 'package:tryagainapi/local_json.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocalJsonPage(),
    );
  }
}
