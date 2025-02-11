import 'package:basic_widget/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterProviderApp extends StatefulWidget {
  const CounterProviderApp({super.key});

  @override
  State<CounterProviderApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterProviderApp> {
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
        onPressed:
            Provider.of<AppProvider>(context, listen: false).incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
