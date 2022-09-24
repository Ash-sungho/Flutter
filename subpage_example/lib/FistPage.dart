import 'package:flutter/material.dart';

import 'SecondPage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('first Page'),
      ),
      body: const Center(
        child: Text('첫번째 페이지'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //푸시로 이동하기
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => SecondPage(),
          //   ),
          // );
          //Route로 이동하기
          Navigator.of(context).pushNamed('/second');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
