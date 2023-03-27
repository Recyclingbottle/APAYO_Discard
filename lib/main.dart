import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Scaffold(
        body: Center(
          child: Text(
            'LNI 팀 창의설계프로젝트',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
