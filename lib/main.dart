import 'package:flutter/material.dart';
import 'package:clima/screens/loading_screen.dart';
import 'package:clima/screens/testingScreen.dart';
import 'package:clima/screens/city_screen.dart';
import 'package:clima/screens/location_screen.dart';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadingScreen(locations:'llll'),
      routes: {
        'TestingScreen':(context)=>TestingScreen(),
        'LoadingScreen':(context)=>LoadingScreen(locations:'llll'),
        'CityScreen':(context)=>CityScreen(),
        'LocationScreen':(context)=>LocationScreen(),
      },
    );
  }
}
