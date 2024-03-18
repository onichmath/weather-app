import 'package:flutter/material.dart';
import 'package:cs492_weather_app/models/weather_forecast.dart';

class DailyForecasts extends StatefulWidget {
  final List<WeatherForecast> forecasts;

  const DailyForecasts({super.key, required this.forecasts});

  @override
  State<DailyForecasts> createState() => _DailyForecastsState();
}

class _DailyForecastsState extends State<DailyForecasts> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.forecasts.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(widget.forecasts[index].name),
            subtitle: Text(widget.forecasts[index].shortForecast),
            trailing: Text('${widget.forecasts[index].temperature}°F'),
          ),
        );
      },
    );
  }
}