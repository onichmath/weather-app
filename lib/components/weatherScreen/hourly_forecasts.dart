import 'package:flutter/material.dart';
import 'package:cs492_weather_app/models/weather_forecast.dart';

class HourlyForecasts extends StatefulWidget {
  final List<WeatherForecast> forecastsHourly;

  const HourlyForecasts({super.key, required this.forecastsHourly});

  @override
  State<HourlyForecasts> createState() => _HourlyForecastsState();
}

class _HourlyForecastsState extends State<HourlyForecasts> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.forecastsHourly.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(widget.forecastsHourly[index].name),
            subtitle: Text(widget.forecastsHourly[index].shortForecast),
            trailing: Text('${widget.forecastsHourly[index].temperature}°F'),
          ),
        );
      },
    );
  }
}