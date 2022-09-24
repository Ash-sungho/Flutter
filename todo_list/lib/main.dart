import 'package:flutter/material.dart';
import 'package:todo_list/SecondDetail.dart';
import 'package:todo_list/SubDetail.dart';
import 'package:todo_list/ThirdDetail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
    '/':(context)=> SubDetail(),
    '/second' : (context) => SecondDetail(),
    '/third' : (context) => ThirdDetail(),
    },
    );
  }
}


