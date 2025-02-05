import 'package:flutter/material.dart';

class ListViewExample extends StatelessWidget {
  const ListViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = List<String>.generate(10000, (i) => 'Item ${i + 1}');

    return Scaffold(
      appBar: AppBar(
        title: Text('List View Example'),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
            tileColor: index.isEven ? Colors.grey : Colors.grey[100],
            title: Text('item ${index + 1}'),
            subtitle: Text('This is a subtitle ${index + 1}'),
          ),
        ),
      ),
    );
  }
}
