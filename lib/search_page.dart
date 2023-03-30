import 'package:flutter/material.dart';
class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("병명 검색"),
          centerTitle: true,
        ),
        body: Text("테스트 화면입니다"),
      ),
    );
  }
}