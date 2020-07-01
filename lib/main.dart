import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_examples/screen1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      home: Screen1(),
    );
  }
}
