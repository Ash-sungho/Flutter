import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class Network {
  late String uri;
  double? lat ;
  double? log ;


  Future<Map<String, dynamic>?> getWeather({required String uri}) async {
    this.uri = uri;
    try {
      http.Response response = await http.get(Uri.parse(uri));
      if (response.statusCode == 200) {
        String? jsonData = response.body;
        Map<String, dynamic> item = jsonDecode(jsonData);
        return item;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<void> locationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    debugPrint(position.toString());

    lat = position.latitude ;
    log = position.longitude;

  }
}
