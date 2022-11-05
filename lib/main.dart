import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/screen/home_screen.dart';
import 'package:getx_practice/service/increment.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final IncrementService incrementService = Get.put(IncrementService());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: HomeScreen());
  }
}
