import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sql_example/todo.dart';

class AddTodoApp extends StatefulWidget {
  const AddTodoApp({Key? key, required this.db}) : super(key: key);
  final Future<Database> db;

  @override
  State<AddTodoApp> createState() => _AddTodoAppState();
}

class _AddTodoAppState extends State<AddTodoApp> {
  TextEditingController? titleController;
  TextEditingController? contentController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    contentController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo추가'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: '제목'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: contentController,
                  decoration: const InputDecoration(labelText: '할일'),
                ),
              ),
              ElevatedButton(onPressed: () {
                Todo todo = Todo(
                  title: titleController?.value.text ,
                  active: 0  ,
                  content: contentController!.value.text ,
                );
                Navigator.of(context).pop(todo);
              }, child: Text('저장하기'))
            ],
          ),
        ),
      ),
    );
  }
}
