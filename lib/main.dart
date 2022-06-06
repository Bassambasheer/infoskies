import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infoskies/theme/theme.dart';
import 'package:infoskies/view/home_page.dart';
import 'package:infoskies/view/location_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      home: const HomeScreen(),
    );
  }
}
