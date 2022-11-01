import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {

  const LoadingScreen({ required this.locations});
  final String locations;

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  List<dynamic> data = [];

  void changeData(var d) {
    setState(() {
      data = [];
      data.add(d);
      print(data[0]['coord']['lon']);
    });
  }

  void getLocation() async {
    try {
      var url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=37b1eb7853838058585b5fc7afeb37e0');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        // var tagsJson = jsonDecode(data);
        // List<String> tags = tagsJson != null ? List.from(tagsJson) : null;
        // print(data['coord']);
        changeData(data);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    print(widget.locations);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  child: Text('Hello'),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  child: SpinKitRotatingCircle(
                    color: Colors.purple,
                    size: 50.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoadingScreen(locations:'Hello');
                  }));
                  // print(data['coord']);
                  //Get the current location
                },
                child: Text('Get Location'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
