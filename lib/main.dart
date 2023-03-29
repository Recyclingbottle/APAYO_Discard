import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('아파요'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  //alignment: Alignment.center,
                  child: Image.asset('hospital.jpg', width: 250, height: 250,),
                ),
                Container(
                  //alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          TextButton(onPressed: (){}, child: Text('병명 검색')),
                          TextButton(onPressed: (){}, child: Text('건강일지 작성'))
                        ],
                      ),
                      Column(
                        children: [
                          TextButton(onPressed: (){}, child: Text('알림')),
                          TextButton(onPressed: (){}, child: Text('건강일지 목록'))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
        )
    );
  }
}
