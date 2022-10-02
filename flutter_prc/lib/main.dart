import 'package:flutter/material.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: myHomePage(),
    );
  }
}

class myHomePage extends StatefulWidget {
  const myHomePage({Key? key}) : super(key: key);

  @override
  State<myHomePage> createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {
  List<String> nameList = [
    '의사',
    '간호사',
    '약사',
    '변호사',
    '경찰',
    '검사',
    '검사',
    '검사',
    '검사',
    '검사'
  ];
  List<String> imagePath = [
    'free-icon-businesswoman-6109247.png',
    'free-icon-clerk-4439994.png',
    'free-icon-girl-4202832.png',
    'free-icon-girl-4202836.png',
    'free-icon-man-4086624.png',
    'free-icon-tyrolean-2053334.png',
    'free-icon-tyrolean-2053334.png',
    'free-icon-tyrolean-2053334.png',
    'free-icon-tyrolean-2053334.png',
    'free-icon-tyrolean-2053334.png',
  ];

  void showDialogfn(context, imagePath, name) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 480,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Image(
                    image: AssetImage(imagePath),
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '저는 $name 입니다.',
                  style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                ),
                ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('안녕하세요 $name입니다'),
                          duration: const Duration(seconds: 2),
                          backgroundColor: Colors.amber,
                        ),
                      );
                    },
                    child: const Text('스낵바 띄어보기'))
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('직업이랑 이름 넣기 테스트')),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: GestureDetector(
                onTap: () {
                  debugPrint(nameList[index]);
                  showDialogfn(
                      context, 'images/${imagePath[index]}', nameList[index]);
                },
                child: Container(
                  color: Colors.amberAccent[100],
                  child: Row(children: <Widget>[

                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset('images/${imagePath[index]}'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      nameList[index],
                      style: TextStyle(fontSize: 20, color: Colors.grey[800]),
                    )
                  ]),
                ),
              ),
            );
          },
          itemCount: nameList.length,
        ));
  }
}
