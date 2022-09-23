import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class LargeFileMain extends StatefulWidget {
  const LargeFileMain({Key? key}) : super(key: key);

  @override
  State<LargeFileMain> createState() => _LargeFileMainState();
}

class _LargeFileMainState extends State<LargeFileMain> {
  //내려받을 이미지 주소
  // final imageUrl =
  //     'https://www.motherjones.com/wp-content/uploads/2019/12/Getty121719.jpg?w=1200&h=630&crop=1';
  TextEditingController? editingController ;
  bool downloading = false;
  var progressString = ''; //현재 얼마나 내려받았는지 표시하는 변수
  String file = ''; //내려받은 파일

  Future<void> downloadFile(imageUrl) async {
    Dio dio = Dio();
    try {
      var dir = await getApplicationDocumentsDirectory();
      await dio.download(imageUrl, '${dir.path}/myImages.jpg',
          onReceiveProgress: (rec, total) {
        // print('Rec : $rec ,Total : $total');
        file = '${dir.path}/myImages.jpg';
        print('file => $file');
        setState(() {
          downloading = true;
          progressString = '${((rec / total) * 100).toStringAsFixed(0)}%';
        });
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        downloading = false;
        progressString = 'complete';
      });
      print('Download Complete');
    }
  }

  Future<Widget> downloadWidget(String filePath) async {
    File file = File(filePath);
    bool exist = await file.exists();
    new FileImage(file).evict(); //캐쉬 초기화 하기

    if (exist) {
      return Center(
        child: Column(
          children: <Widget>[Image.file(file)],
        ),
      );
    } else {
      return Text('no Data');
    }
  }
  @override
  void initState(){
    super.initState();

    editingController = TextEditingController(text: 'https://www.motherjones.com/wp-content/uploads/2019/12/Getty121719.jpg?w=1200&h=630&crop=1');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: editingController,
          keyboardType: TextInputType.text,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(hintText: 'url 을 입력하세요'),
        ),
      ),
      body: Center(
          child: downloading
              ? Container(
                  height: 120,
                  width: 200,
                  child: Card(
                    color: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const CircularProgressIndicator(),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Downloading File $progressString',
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )
              : FutureBuilder(
                  builder: (context, snapshot) {
                    print('=>>${snapshot.connectionState}');
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        print('none');
                        return const Text('데이터없음');
                      case ConnectionState.waiting:
                        print('waiting');
                        return const CircularProgressIndicator();
                      case ConnectionState.active:
                        print('active');
                        return const CircularProgressIndicator();
                      case ConnectionState.done:
                        print('done');
                        if (snapshot.hasData) {
                          return snapshot.data as Widget;
                        }
                    }
                    print('end Process');
                    return const Text('데이터 없음');
                  },
                  future: downloadWidget(file),
                )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          downloadFile(editingController?.value.text);
        },
        child: const Icon(Icons.file_download),
      ),
    );
  }
}
