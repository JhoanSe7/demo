import 'package:flutter/material.dart';

import 'demo_injection.dart';

void main() {
  runApp(const AppDemo());
}

class AppDemo extends StatelessWidget {
  const AppDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginInjection.injection(),
    );
  }
}
