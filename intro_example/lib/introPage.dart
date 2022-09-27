import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intro_example/main.dart';
import 'package:path_provider/path_provider.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPage();
}

class _IntroPage extends State<IntroPage> {
  Widget logo = Icon(
    Icons.info,
    size: 50,
  );

  void initData() async {
    var dir = await getApplicationDocumentsDirectory();
    debugPrint('111');
    bool fileExist = await File('${dir.path}/myImages.jpg').exists();
    debugPrint('fileExist :${fileExist}');
    if (fileExist) {
      setState(() {
        logo = Image.file(
          File('${dir.path}/myImages.jpg'),
          height: 200,
          width: 200,
          fit: BoxFit.contain,
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              logo,
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return MyHomePage(title: '');
                    }));
                  },
                  child: Text('다음으로 가기'))
            ],
          ),
        ),
      ),
    );
  }
}
