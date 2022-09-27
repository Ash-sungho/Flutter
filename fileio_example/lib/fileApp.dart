import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FileApp extends StatefulWidget {
  const FileApp({Key? key}) : super(key: key);

  @override
  State<FileApp> createState() => _FileAppState();
}

class _FileAppState extends State<FileApp> {
  int _count = 0;
  List<String> itemList = List.empty(growable: true);
  TextEditingController controller = TextEditingController();

  Future<List<String>> readListFile() async {
    List<String> itemList = List.empty(growable: true);
    // var key = 'count';
    var key = 'first';
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool? firstCheck = pref.getBool(key);
    var dir = await getApplicationDocumentsDirectory();

    bool fileExist = await File('${dir.path}/fruit.txt').exists();
    debugPrint('fileExist : ${fileExist.toString()}');
    if (firstCheck == null || firstCheck == false || fileExist == false) {
      pref.setBool(key, true);
      var file =
          await DefaultAssetBundle.of(context).loadString('repo/fruit.txt');
      debugPrint(file);
      File('${dir.path}/fruit.txt').writeAsStringSync(file);

      var array = file.split('\n');
      for (var item in array) {
        debugPrint('item : $item');
        itemList.add(item);
      }
    } else {
      var file = await File('${dir.path}/fruit.txt').readAsString();
      var array = file.split('\n');
      debugPrint(array.toString());
      for (var item in array) {
        debugPrint(item);
        itemList.add(item);
      }
    }

    return itemList;
  }

  void writeFruit(String fruit) async {
    var dir = await getApplicationDocumentsDirectory();
    var file = await File('${dir.path}/fruit.txt').readAsString();
    file = '$file\n$fruit';
    File('${dir.path}/fruit.txt').writeAsStringSync(file);
  }

  void initData() async {
    var result = await readListFile();
    setState(() {
      itemList.addAll(result);
    });
  }

  void writeCountFile(int count) async {
    var dir = await getApplicationDocumentsDirectory();
    File('${dir.path}/count.txt').writeAsStringSync(count.toString());
  }

  void readCountFile() async {
    try {
      var dir = await getApplicationDocumentsDirectory();
      var file = await File('${dir.path}/count.txt').readAsString();
      debugPrint('file : $file');
      setState(() {
        _count = int.parse(file);
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    // readCountFile();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Example'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          writeFruit(controller.value.text);
          setState(() {
            itemList.add(controller.value.text);
          });
          // setState(() {
          //   _count++;
          // });
          // writeCountFile(_count);
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(
                controller: controller,
                keyboardType: TextInputType.text,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: Center(
                          child: Text(
                        itemList[index],
                        style: TextStyle(fontSize: 30),
                      )),
                    );
                  },
                  itemCount: itemList.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
