import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Widget Example';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: _title, home: WidgetApp());
  }
}

class WidgetApp extends StatefulWidget {
  const WidgetApp({super.key});

  @override
  State<StatefulWidget> createState() => _WidgetExampleState();
}

class _WidgetExampleState extends State<WidgetApp> {
  String sum = '';
  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();

  final List _buttonList = ['더하기', '빼기', '곱하기', '나누기'];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = [];
  String _buttonText = '';

  @override
  void initState() {
    super.initState();
    for (var item in _buttonList) {
      debugPrint(item);
      _dropDownMenuItems.add(DropdownMenuItem(
        value: item,
        child: Text(item),
      ));
    }
    _buttonText = _dropDownMenuItems[0].value!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widget Example')),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  '결과 : $sum',
                  style: const TextStyle(fontSize: 20),
                )),
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                    keyboardType: TextInputType.number, controller: value1)),
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                    keyboardType: TextInputType.number, controller: value2)),
            Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.amber)),
                  onPressed: () {

                    setState(() {
                      var value1Int = int.parse(value1.value.text);
                      var value2Int = int.parse(value2.value.text);
                      var result;
                      if(_buttonText =='더하기'){
                        result = value1Int + value2Int;
                      }else if(_buttonText =='빼기'){
                        result = value1Int - value2Int;
                      }else if(_buttonText =='곱하기'){
                        result = value1Int * value2Int;
                      }else if(_buttonText =='나누기'){
                        result = value1Int / value2Int;
                      }
                    sum='$result';
                    });
                  },
                  child: Row(
                    children:  <Widget>[
                      const Icon(Icons.add, color: Colors.black),
                      Text(
                        _buttonText,
                        style: const TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                )),
            Padding(
                padding: const EdgeInsets.all(15),
                child: DropdownButton(
                  onChanged: (value) {
                    setState(() {
                      _buttonText = value!;
                    });
                  },
                  items: _dropDownMenuItems,
                  value: _buttonText,
                )),
          ],
        ),
      ),
    );
  }
}
