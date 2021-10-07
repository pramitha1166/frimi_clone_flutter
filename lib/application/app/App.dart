import 'package:flutter/material.dart';
import 'package:frimi_clone/application/screens/Navigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigation(),
      debugShowCheckedModeBanner: false,
    );
  }
}
