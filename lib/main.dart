import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat/screens/chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: Scaffold(resizeToAvoidBottomInset: true, body: MyChat()),
    );
  }
}
