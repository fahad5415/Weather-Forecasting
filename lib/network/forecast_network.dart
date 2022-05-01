import 'dart:convert';
import 'package:http/http.dart';
import 'package:weather_forecast/util/forecast_util.dart';
import 'package:weather_forecast/model/weather_forecast_model.dart';

class Network {
  Future<WeatherForecastModel> getWeatherForecast(String cityName) async {
    String finalUrl = "https://api.openweathermap.org/data/2.5/weather?q=" +
        cityName +
        "&APPID=" +
        Util.appId +
        "&units=metric";

    Response response = await get(Uri.parse(finalUrl));

    print(finalUrl);

    if (response.statusCode == 200) {
      print(response.body);

      return WeatherForecastModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
