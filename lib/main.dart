import 'package:flutter/material.dart';
import 'package:weather_forecast/ui/weather_forecast.dart';

ThemeData _appTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
      textTheme: TextTheme(bodyText2: TextStyle(fontFamily: "BalooBhaijaan2")));
}

void main() {
  runApp(new MaterialApp(
    theme: _appTheme(),
    // theme: ThemeData(
    //     textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
    //     iconTheme: IconThemeData(color: Colors.white)),
    home: WeatherForecast(),
  ));
}
