import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getIcon(String weatherDiscription, Color color, double size) {
  switch (weatherDiscription) {
    case "Clear":
      {
        return Icon(
          FontAwesomeIcons.sun,
          color: color,
          size: size,
        );
      }
    case "Clouds":
      {
        return Icon(
          FontAwesomeIcons.cloud,
          color: color,
          size: size,
        );
      }

    case "Rain":
      {
        return Icon(FontAwesomeIcons.rainbow, color: color, size: size);
      }
    case "Snow":
      {
        return Icon(FontAwesomeIcons.snowman, color: color, size: size);
      }

    case "Smoke":
      {
        return Icon(
          FontAwesomeIcons.snowman,
          color: color,
          size: size,
        );
      }

    default:
      {
        {
          return Icon(FontAwesomeIcons.sun, color: color, size: size);
        }
      }
  }
}



































/*
Widget getWeatherIcon(
    {required String weatherDiscription,
    required Color color,
    required double size}) {
  switch (weatherDiscription) {
    case "Clear":
      {
        return Icon(
          FontAwesomeIcons.sun,
          color: color,
          size: size,
        );
      }

    case "Rain":
      {
        return Icon(
          FontAwesomeIcons.cloudRain,
          color: color,
          size: size,
        );
      }

    case "Snow":
      {
        return Icon(
          FontAwesomeIcons.snowman,
          color: color,
          size: size,
        );
      }

    case "Clouds":
      {
        return Icon(
          FontAwesomeIcons.cloud,
          color: color,
          size: size,
        );
      }

    default:
      {
        return Icon(
          FontAwesomeIcons.sun,
          color: color,
          size: size,
        );
      }
  }
}
*/
