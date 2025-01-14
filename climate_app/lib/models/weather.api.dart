import 'dart:convert';
import 'package:climate_app/models/weather.dart';
import 'package:http/http.dart' as http;
//import 'package:weather_app/models/weather.dart';

class WeatherApi {
  static Future<List<Weather>> getWeather(String city) async {
    var uri = Uri.https(
      'weatherapi-com.p.rapidapi.com',
      'forecast.json',
      {"q": city, "days": "3"},
    );
    final response = await http.get(uri, headers: {
      'x-rapidapi-host': 'api.openweathermap.org',
      'x-rapidapi-key':
          'http://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=952be774248bf61146413bab634fb025'
      //TODO: add api key from https://rapidapi.com/weatherapi/api/weatherapi-com/
    });
    Map data = jsonDecode(response.body);
    List _temp = [];
    for (var i in data['forecast']['forecastday']) {
      _temp.add(i);
    }
    return Weather.weatherFromSnapshot(_temp);
  }
}
