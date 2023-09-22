import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String key = '1af40721d38d4b3da1471834231603';

  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url = Uri.parse('$baseUrl/forecast.json?key=$key&q=$cityName&days=1');

    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromJson(data);

    return weather;
  }
}
