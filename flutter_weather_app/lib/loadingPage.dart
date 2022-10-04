import 'package:flutter/material.dart';
import 'package:flutter_weather_app/network.dart';
import 'package:flutter_weather_app/weatherAppMain.dart';

const apikey = '6add483a794586b5e443fbc076796900';

class LoadingPage extends StatefulWidget {
  LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Network network = Network();
  Map<String, dynamic>? item;
  double? lat;
  double? log;

  void getPosition() async {
    await network.locationPermission();
    lat = network.lat;
    log = network.log;
  }

  @override
  void initState() {
    super.initState();
    getPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('fetchData'),
          onPressed: () async {
            item = await network.getWeather(
                uri:
                    'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$log&appid=$apikey');
            print(item);

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => WeatherAppMain(),
              ),
            );
          },
        ),
      ),
    );
  }
}
