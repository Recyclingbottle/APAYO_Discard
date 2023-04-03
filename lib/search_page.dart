import 'package:flutter/material.dart';
import 'symptomcheck_page.dart';

class SearchPage extends StatelessWidget {
  final List<String> bodyParts = const [
    '등/허리',
    '다리',
    '골반(생식기)',
    '손',
    '발',
    '목',
    '머리',
    '팔',
    '배',
    '코',
    '귀',
    '입',
    '피부',
  ];

  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("병명 검색"),
        ),
        body: SingleChildScrollView(  // 스크롤이 가능하도록 SingleChildScrollView 추가
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildButton(context, bodyParts[0]),
                  _buildButton(context, bodyParts[1]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildButton(context, bodyParts[2]),
                  _buildButton(context, bodyParts[3]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildButton(context, bodyParts[4]),
                  _buildButton(context, bodyParts[5]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildButton(context, bodyParts[6]),
                  _buildButton(context, bodyParts[7]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildButton(context, bodyParts[8]),
                  _buildButton(context, bodyParts[9]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildButton(context, bodyParts[10]),
                  _buildButton(context, bodyParts[11]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton(context, bodyParts[12]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 100,
        height: 100,
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SymptomCheckPage(selectedPart: text),
              ),
            );
          },
          child: Text(
            text,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
