import 'package:basic_widget/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterProviderApp extends StatelessWidget {
  const CounterProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App with Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('You have pushed the button this many times:'),
            Consumer<AppProvider>(
              builder: (context, provider, child) => Text(
                '${provider.counter}',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: Provider.of<AppProvider>(context, listen: false)
            .incrementCounter, // listen: false to avoid rebuild we need only call the function
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
