import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: TextField(
            onChanged: (value) {
              cityName = value;
            },
            onSubmitted: (value) async {
              cityName = value;

              BlocProvider.of<WeatherCubit>(context)
                  .getWeather(cityName: cityName!);

              BlocProvider.of<WeatherCubit>(context).cityName = cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 24,
              ),
              border: OutlineInputBorder(),
              labelText: 'search',
              hintText: 'Enter a city',
              suffixIcon: GestureDetector(
                onTap: () async {
                  WeatherService service = WeatherService();
                  WeatherModel weather =
                      await service.getWeather(cityName: cityName!);

                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherData = weather;
                  Provider.of<WeatherProvider>(context, listen: false)
                      .cityName = cityName;

                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.search,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
