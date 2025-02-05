import 'package:basic_widget/grid_view_example.dart';
import 'package:basic_widget/home_page.dart';
import 'package:basic_widget/list_view_example.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize
              .min, // take minimum vertical space (only the space required by the children)
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text('Go home'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListViewExample()));
              },
              child: Text('Go List View Example'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GridViewExample()));
              },
              child: Text('Go Grid View Example'),
            ),
          ],
        ),
      ),
    );
  }
}
