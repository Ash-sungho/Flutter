import 'package:flutter/material.dart';

class WeatherAppMain extends StatefulWidget {
  const WeatherAppMain({Key? key}) : super(key: key);

  @override
  State<WeatherAppMain> createState() => _WeatherAppMainState();
}

class _WeatherAppMainState extends State<WeatherAppMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const Icon(Icons.near_me,size: 30),
        actions: const [
           Icon(Icons.location_searching,size: 30),
          SizedBox(width: 16)
        ],
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Text(''),
      ),
        body: Stack(
          children: [
            Image.asset('images/background.jpg',height: double.infinity,fit: BoxFit.fill,),
              Container(
                child: Column(
                  children: const <Widget>[

                    Text('서울')
                  ],
                ),
              )
          ],
        ),

    );
  }
}
