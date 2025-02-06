import 'package:flutter/material.dart';

class InputWidgetsExample extends StatefulWidget {
  const InputWidgetsExample({super.key});

  @override
  State<InputWidgetsExample> createState() => _InputWidgetsExampleState();
}

class _InputWidgetsExampleState extends State<InputWidgetsExample> {
  final nameController = TextEditingController();
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Widgets'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                // hintText: 'Enter your name',
                label: Text('Enter your name'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print(nameController.text);
              },
              child: Text('OK'),
            ),
            Row(
              children: [
                Checkbox(
                  value: checked,
                  onChanged: (value) {
                    setState(() {
                      checked = value!;
                    });
                  },
                ),
                Text('Flutter')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
