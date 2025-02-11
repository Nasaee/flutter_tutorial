import 'package:basic_widget/counter_app.dart';
import 'package:basic_widget/grid_view_example.dart';
import 'package:basic_widget/home_page.dart';
import 'package:basic_widget/input_widgets_example.dart';
import 'package:basic_widget/list_view_example.dart';
import 'package:basic_widget/counter_provider_state_management.dart';
import 'package:basic_widget/my_todos_page.dart';
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
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CounterApp()));
              },
              child: Text('Go Counter App Example'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InputWidgetsExample()));
              },
              child: Text('Go Input Widgets Example'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TodoPage()));
              },
              child: Text('My Todos'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CounterProviderApp()));
              },
              child: Text('Todo Provider state management'),
            ),
          ],
        ),
      ),
    );
  }
}
