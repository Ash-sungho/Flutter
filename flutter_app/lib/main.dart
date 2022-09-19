import 'package:flutter/material.dart';

// ignore_for_file: avoid_print
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  var swichvalue = false;
  String test = 'hello';
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'flutter demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        darkTheme: ThemeData.light(),
        home: Scaffold(
            body: Center(
                child: ElevatedButton(

          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(_color),
          ),
          onPressed: () {
            if (_color == Colors.blue) {
              setState(() {
                test = 'flutter';
                _color = Colors.amber;
              });
            } else {
              setState(() {
                test = 'hello';
                _color = Colors.blue;
              });
            }
          },
                  child: Text(test),
        ))));
  }

  @override
  void initState() {
    super.initState();
    debugPrint('initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('didChangeDependencies');
  }
}
