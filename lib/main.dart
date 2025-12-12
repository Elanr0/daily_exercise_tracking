import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/home_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Exercise Tracking',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 232, 134, 219)),
      ),
      home: HomePage()
    );
  }
}
