import 'package:flutter/material.dart';

class ThirdDetail extends StatefulWidget {
  const ThirdDetail({Key? key}) : super(key: key);

  @override
  State<ThirdDetail> createState() => _ThirdDetail();
}

class _ThirdDetail extends State<ThirdDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondDetail Example'),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            child: Text('돌아가기'),
            onPressed: (){
              Navigator.of(context).pushNamed('/');
            },
          ),
        ),
      )
    );
  }
}
