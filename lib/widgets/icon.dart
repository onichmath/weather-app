import 'package:flutter/material.dart';
import 'package:cs492_weather_app/models/weather_forecast.dart';
import 'package:weather_icons/weather_icons.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({
    Key? key,
    required this.forecasts,
  }) : super(key: key);

  final List<WeatherForecast> forecasts;

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    Color iconColor;

    // Determine the icon and color based on forecast data
    if (forecasts.isNotEmpty) {
      final WeatherForecast firstForecast = forecasts.first;
      final bool isDaytime = firstForecast.isDaytime;
      if (firstForecast.shortForecast.contains("Sunny")) {
        iconData = WeatherIcons.day_sunny;
        iconColor = Colors.yellow;
      } else if (firstForecast.shortForecast.contains("Cloud")) {
        iconData = isDaytime ? WeatherIcons.day_cloudy : WeatherIcons.night_cloudy;
        iconColor = Colors.grey;
      } else if (firstForecast.shortForecast.contains("Rain")) {
        iconData = isDaytime ? WeatherIcons.day_rain : WeatherIcons.night_rain;
        iconColor = Colors.blue;
      } else if (firstForecast.shortForecast.contains("Snow")) {
        iconData = isDaytime ? WeatherIcons.day_snow : WeatherIcons.night_snow;
        iconColor = Colors.grey;
      } else if (firstForecast.shortForecast.contains("Clear")) {
        iconData = isDaytime ? WeatherIcons.day_sunny : WeatherIcons.night_clear;
        iconColor = Colors.black;
      }
      else {
        iconData = Icons.question_mark;
        iconColor = Colors.red;
      }
    } else {
      iconData = Icons.question_mark;
      iconColor = Colors.red;
    }

    return Expanded(
      child: Center(
        child: Icon(iconData, size: 60, color: iconColor),
      ),
    );
  }
}
