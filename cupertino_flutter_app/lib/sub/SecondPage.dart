import 'dart:ui';

import 'package:cupertino_flutter_app/animalItem.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key, required this.list}) : super(key: key);
  final List<Animal>? list;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final nameController = TextEditingController();
  int? radioValue = 0;
  bool? flyExist = false;

  String? _imagePath;

  _radioChange(int? value) {
    setState(() {
      radioValue = value;
    });
  }

  getKind(int? radioValue) {
    switch (radioValue) {
      case 0:
        return '양서류';
      case 1:
        return '파충류';
      case 2:
        return '포유류';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(children: <Widget>[
            TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              maxLines: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Radio(
                    value: 0, groupValue: radioValue, onChanged: _radioChange),
                Text('양서류'),
                Radio(
                    value: 1, groupValue: radioValue, onChanged: _radioChange),
                Text('파충류'),
                Radio(
                    value: 2, groupValue: radioValue, onChanged: _radioChange),
                Text('포유류'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const Text('날 수 있나요?'),
                Checkbox(
                    value: flyExist,
                    onChanged: (bool? value) {
                      setState(() {
                        flyExist = value;
                      });
                    }),
              ],
            ),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  GestureDetector(
                    child: Image.asset('repo/images/cow.png',
                        width: 80, fit: BoxFit.cover),
                    onTap: () {
                      _imagePath = 'repo/images/cow.png';
                    },
                  ),
                  GestureDetector(
                    child: Image.asset('repo/images/bee.png',
                        width: 80, fit: BoxFit.cover),
                    onTap: () {
                      _imagePath = 'repo/images/bee.png';
                    },
                  ),
                  GestureDetector(
                    child: Image.asset('repo/images/cat.png',
                        width: 80, fit: BoxFit.cover),
                    onTap: () {
                      _imagePath = 'repo/images/cat.png';
                    },
                  ),
                  GestureDetector(
                    child: Image.asset('repo/images/dog.png',
                        width: 80, fit: BoxFit.cover),
                    onTap: () {
                      _imagePath = 'repo/images/dog.png';
                    },
                  ),
                  GestureDetector(
                    child: Image.asset('repo/images/fox.png',
                        width: 80, fit: BoxFit.cover),
                    onTap: () {
                      _imagePath = 'repo/images/fox.png';
                    },
                  ),
                  GestureDetector(
                    child: Image.asset('repo/images/monkey.png',
                        width: 80, fit: BoxFit.cover),
                    onTap: () {
                      _imagePath = 'repo/images/monkey.png';
                    },
                  ),
                  GestureDetector(
                    child: Image.asset('repo/images/wolf.png',
                        width: 80, fit: BoxFit.cover),
                    onTap: () {
                      _imagePath = 'repo/images/wolf.png';
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  var animal = Animal(
                      animalName: nameController.value.text,
                      kind: getKind(radioValue),
                      imagePath: _imagePath,
                      flyExist: flyExist);
                  AlertDialog dialog = AlertDialog(
                    title: Text('동물 추가하기'),
                    content: Text('이 동물은 ${animal.animalName}입니다.\n'
                        '또 이 동물의 종류는 ${animal.kind}입니다.\n'
                        '이 동물을 추가하시겠습니까?'),
                    actions: <Widget>[
                      ElevatedButton(
                          onPressed: () {
                            widget.list?.add(animal);
                            Navigator.of(context).pop();
                          },
                          child: Text('예')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('아니오'))
                    ],
                  );
                  showDialog(context: context, builder: (context) => dialog);
                },
                child: const Text('동물 추가하기'))
          ]),
        ),
      ),
    );
  }
}
