import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;
  String image;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.image,
      required this.weatherStateName});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data["forecast"]["forecastday"][0]["day"];

    return WeatherModel(
      date: DateTime.parse(data["location"]["localtime"]),
      temp: jsonData["avgtemp_c"],
      maxTemp: jsonData["maxtemp_c"],
      minTemp: jsonData["mintemp_c"],
      image: data["current"]["condition"]["icon"],
      weatherStateName: jsonData["condition"]["text"],
    );
  }

  String getImage() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Sunny') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Patchy snow possible' ||
        weatherStateName == 'Heavy snow' ||
        weatherStateName == 'Moderate snow') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Partly cloudy') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Light rain' ||
        weatherStateName == "Heavy rain") {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thundery outbreaks possible') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Sunny') {
      return Colors.orange;
    } else if (weatherStateName == 'Patchy snow possible' ||
        weatherStateName == 'Heavy snow' ||
        weatherStateName == 'Moderate snow') {
      return Colors.blue;
    } else if (weatherStateName == 'Partly cloudy') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Light rain' ||
        weatherStateName == "Heavy rain") {
      return Colors.blue;
    } else if (weatherStateName == 'Thundery outbreaks possible') {
      return Colors.grey;
    } else {
      return Colors.orange;
    }
  }

  // @override
  // String toString() {
  //   return 'date = $date, temp = $temp, maxTemp = $maxTemp, minTemp = $minTemp, stateWeatherName = $weatherStateName';
  // }
}
