import 'package:flutter/material.dart';
import 'package:flutter_navigation/page_one_detail.dart';
import 'package:go_router/go_router.dart';

class PageOne extends StatelessWidget {
  static const String routeName = 'one';
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageOne'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                context.goNamed(PageOneDetails.routeName);
              },
              child: const Text('Page One Details'),
            ),
          ],
        ),
      ),
    );
  }
}
