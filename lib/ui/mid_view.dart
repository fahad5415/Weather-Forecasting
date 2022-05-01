import 'package:flutter/material.dart';
import 'package:weather_forecast/model/weather_forecast_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_forecast/util/convert_icon.dart';
import 'package:weather_forecast/util/forecast_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${snapshot.data!.name}, ${snapshot.data!.sys!.country}"
              .toUpperCase(),
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            Util.dateFormatted(new DateTime.fromMillisecondsSinceEpoch(
                snapshot.data!.dt! * 1000)),
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        getIcon(snapshot.data!.weather![0].main!, Colors.blue, 180),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${snapshot.data!.main!.temp!.toStringAsFixed(0)}°C",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                snapshot.data!.weather![0].description!.toUpperCase(),
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Speed",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "${snapshot.data!.wind!.speed!.toStringAsFixed(1)} km/h",
                    style: TextStyle(fontSize: 16),
                  ),
                  Icon(
                    FontAwesomeIcons.wind,
                    size: 20,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "TempMax",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "${snapshot.data!.main!.tempMax!.toStringAsFixed(0)}°C",
                    style: TextStyle(fontSize: 16),
                  ),
                  Icon(
                    FontAwesomeIcons.temperatureHigh,
                    size: 20,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "TempMin",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "${snapshot.data!.main!.tempMin!.toStringAsFixed(0)}°C",
                    style: TextStyle(fontSize: 16),
                  ),
                  Icon(
                    FontAwesomeIcons.temperatureLow,
                    size: 20,
                  )
                ],
              ),
            )
          ],
        )
      ],
    ),
  );
}
