// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:todo_app/Pages/Home_page.dart';
// ignore: unused_import
import 'package:todo_app/Utilities/todo_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const homepage(),
      theme: ThemeData(primarySwatch: Colors.amber),
    );
  }
}
