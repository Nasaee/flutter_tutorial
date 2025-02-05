import 'package:basic_widget/grid_view_example.dart';
import 'package:basic_widget/list_view_example.dart';
import 'package:basic_widget/menu_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuPage(),
    );
  }
}
