import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  static const String routeName = 'two';
  final String greeting;

  const PageTwo({super.key, required this.greeting});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageTwo'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(greeting),
          ],
        ),
      ),
    );
  }
}
