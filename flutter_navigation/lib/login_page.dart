import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  static const String routeName = 'login';
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Login Page',
                style: Theme.of(context).textTheme.headlineLarge),
          ],
        ),
      ),
    );
  }
}
