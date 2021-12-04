import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:climate/services/weather.dart';

const apiKey = 'e631024985ea1f5134be7d3d495fdcad';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.center,
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
              child: Image.asset(
                'images/map.png',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Allow your location',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF3ba4ff),
                // color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(2.0),
            child: Text(
              ' We will need your location to give you a better experience,',
              textAlign: TextAlign.center,
              style: TextStyle(
                //fontWeight: FontWeight.bold,
                fontSize: 22.0,
                color: Colors.black26,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              textColor: Colors.white,
              color: const Color(0xFF3ba4ff),
              //color: Colors.blue.shade400,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: const Text(
                'Get Location',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                getLocationData();
              },
            ),
          ),
        ],
      ),
    );
  }
}
