import 'package:animation_example/People.dart';
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
          primarySwatch: Colors.blue,
        ),
        home: const AnimationApp());
  }
}

class AnimationApp extends StatefulWidget {
  const AnimationApp({Key? key}) : super(key: key);

  @override
  State<AnimationApp> createState() => _AnimationAppState();
}

class _AnimationAppState extends State<AnimationApp> {
  List<People> peoples = List.empty(growable: true);
  int current = 0;

  @override
  void initState() {
    super.initState();

    peoples.add(People(name: '스미스', height: 180, weight: 92));
    peoples.add(People(name: '메리', height: 162, weight: 55));
    peoples.add(People(name: '존', height: 177, weight: 75));
    peoples.add(People(name: '바트', height: 130, weight: 40));
    peoples.add(People(name: '콘', height: 194, weight: 140));
    peoples.add(People(name: '디디', height: 100, weight: 80));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Example'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                      child: Text('이름 ${peoples[current].name}'),
                    ),
                    AnimatedContainer(
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeInCubic,
                      color: Colors.amber,
                      width: 50,
                      height: peoples[current].height,
                      child: Text(
                        '키 ${peoples[current].height}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeInCubic,
                      color: Colors.blue,
                      width: 50,
                      height: peoples[current].weight,
                      child: Text(
                        '몸무게 ${peoples[current].weight}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(seconds: 2),
                      curve: Curves.linear,
                      color: Colors.pinkAccent,
                      width: 50,
                      height: peoples[current].bmi,
                      child: Text(
                        'bmi ${peoples[current].bmi.toString().substring(0, 2)}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(onPressed: () {
                setState(() {
                  if(current < peoples.length - 1){
                    current ++;
                  }
                });

              },
                  child:const Text('다음')
              ),
              ElevatedButton(onPressed: () {
                setState(() {
                  if(current > 0){
                    current --;
                  }
                });

              },
                  child: const Text('이전')
              ),
            ],
          ),
        ),
      ),
    );
  }
}
