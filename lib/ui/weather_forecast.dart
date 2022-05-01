import 'package:flutter/material.dart';
import 'package:weather_forecast/network/forecast_network.dart';
import 'package:weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_forecast/ui/mid_view.dart';
import 'package:weather_forecast/util/forecast_util.dart';
import 'package:weather_forecast/util/convert_icon.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({Key? key}) : super(key: key);

  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  late Future<WeatherForecastModel> forecastObject;

  String _cityName = "Okara";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    forecastObject = Network().getWeatherForecast(_cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _textField(),
          Container(
            child: FutureBuilder(
                future: forecastObject,
                builder:
                    (context, AsyncSnapshot<WeatherForecastModel> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        midView(snapshot),
                        bottomView(snapshot, context)
                      ],
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }

  Widget _textField() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: TextField(
          decoration: InputDecoration(
              hintText: "Enter the City",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: EdgeInsets.all(12)),
          onSubmitted: (value) {
            setState(() {
              _cityName = value;
              forecastObject = new Network().getWeatherForecast(_cityName);
            });
          },
        ),
      ),
    );
  }

  Widget bottomView(
      AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context) {
    var forecastList = snapshot.data!.weather;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "1-day Weather Forecast".toUpperCase(),
            style: TextStyle(color: Colors.grey, fontSize: 17),
          ),
          SizedBox(height: 8),
          Container(
            height: 170,
            child: ListView.separated(
                separatorBuilder: (context, int index) => SizedBox(
                      width: 5,
                    ),
                itemCount: forecastList!.length,
                itemBuilder: (context, int index) => ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        child: forecastCard(snapshot),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.blue, Colors.white],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight)),
                      ),
                    )),
          )
        ],
      ),
    );
  }

  Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot) {
    var fullDate = Util.dateFormatted(
        new DateTime.fromMillisecondsSinceEpoch(snapshot.data!.dt! * 1000));

    var dayOfWeek = fullDate.split(",")[0];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            dayOfWeek,
            style: TextStyle(fontSize: 17),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child:
                    getIcon(snapshot.data!.weather![0].main!, Colors.blue, 50),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Humidity: ${snapshot.data!.main!.humidity}%"),
                  Text(
                      "Speed: ${snapshot.data!.wind!.speed!.toStringAsFixed(1)} km/h"),
                  Text(
                      "TempMax: ${snapshot.data!.main!.tempMax!.toStringAsFixed(0)}°C"),
                  Text(
                      "TempMin: ${snapshot.data!.main!.tempMin!.toStringAsFixed(0)}°C")
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
