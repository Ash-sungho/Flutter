import 'package:flutter/material.dart';

class SubDetail extends StatefulWidget {
  const SubDetail({Key? key}) : super(key: key);

  @override
  State<SubDetail> createState() => _SubDetail();
}

class _SubDetail extends State<SubDetail> {
  List<String> todoList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();

    todoList.add('당근사오기');
    todoList.add('당근사오기2');
    todoList.add('당근사오기3');
    todoList.add('당근사오기4');
    todoList.add('당근사오기5');
  }

  @override
  Widget build(BuildContext context) {
    void addNavigation(BuildContext context) async {
      debugPrint('11');
      final result = await Navigator.of(context).pushNamed('/second');
      debugPrint(result as String);
      setState(() {
        todoList.add(result as String);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('SubDetail Example'),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/second', arguments: todoList[index]);
              },
              child:
                  Text(todoList[index], style: const TextStyle(fontSize: 30)),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNavigation(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
