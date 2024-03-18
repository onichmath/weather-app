import 'package:cs492_weather_app/components/weatherScreen/daily_forecasts.dart';
import 'package:cs492_weather_app/components/weatherScreen/hourly_forecasts.dart';
import 'package:cs492_weather_app/models/weather_forecast.dart';
import '../../models/user_location.dart';
import 'package:flutter/material.dart';
import '../location/location.dart';

class WeatherScreen extends StatefulWidget {
  final Function getLocation;
  final Function getForecasts;
  final Function getForecastsHourly;
  final Function setLocation;

  const WeatherScreen(
      {super.key,
      required this.getLocation,
      required this.getForecasts,
      required this.getForecastsHourly,
      required this.setLocation});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return (widget.getLocation() != null && widget.getForecasts().isNotEmpty
        ? ForecastWidget(
            context: context,
            location: widget.getLocation(),
            forecastsHourly: widget.getForecastsHourly(),
            forecasts: widget.getForecasts(),)
        : LocationWidget(widget: widget));
  }
}

class ForecastWidget extends StatelessWidget {
  final UserLocation location;
  final List<WeatherForecast> forecastsHourly;
  final List<WeatherForecast> forecasts;
  final BuildContext context;

  const ForecastWidget(
      {super.key,
      required this.context,
      required this.location,
      required this.forecasts,
      required this.forecastsHourly});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            CurrentForecast(location: location, forecastsHourly: forecastsHourly),
          ],
        ),
      ),
    );
  }
}
class CurrentForecast extends StatelessWidget {
  const CurrentForecast({
    super.key,
    required this.location,
    required this.forecastsHourly
  });

  final UserLocation location;
  final List<WeatherForecast> forecastsHourly;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                TemperatureWidget(forecasts: forecastsHourly),
                LocationTextWidget(location: location),
              ],
            ),
          ),
          Expanded(child: Column(
            children: [
              Icon(Icons.sunny, size: 100, color: Colors.yellow,),
            ],
          ))
        ],
      ),
    );
  }
}


class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
    required this.forecasts,
  });

  final List<WeatherForecast> forecasts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 500,
      child: Center(
        child: Text(forecasts.elementAt(0).shortForecast,
            style: Theme.of(context).textTheme.headlineSmall),
      ),
    );
  }
}

class TemperatureWidget extends StatelessWidget {
  const TemperatureWidget({
    super.key,
    required this.forecasts,
  });

  final List<WeatherForecast> forecasts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 60,
      child: Center(
        child: Text('${forecasts.elementAt(0).temperature}º',
            style: Theme.of(context).textTheme.displayLarge),
      ),
    );
  }
}

class LocationTextWidget extends StatelessWidget {
  const LocationTextWidget({
    super.key,
    required this.location,
  });

  final UserLocation location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Center(
        child: SizedBox(
          width: 500,
          child: Center(
            child: Text("${location.city}, ${location.state}, ${location.zip}",
                style: Theme.of(context).textTheme.bodyLarge),
          ),
        ),
      ),
    );
  }
}

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
    required this.widget,
  });

  final WeatherScreen widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Requires a location to begin"),
          ),
          Location(
              setLocation: widget.setLocation,
              getLocation: widget.getLocation),
        ],
      ),
    );
  }
}
