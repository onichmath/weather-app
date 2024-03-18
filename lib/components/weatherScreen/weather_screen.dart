import 'package:cs492_weather_app/components/weatherScreen/daily_forecasts.dart';
import 'package:cs492_weather_app/components/weatherScreen/hourly_forecasts.dart';
import 'package:cs492_weather_app/models/weather_forecast.dart';
import '../../models/user_location.dart';
import 'package:flutter/material.dart';
import '../location/location.dart';
import 'package:weather_icons/weather_icons.dart';

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
            //context: context,
            location: widget.getLocation(),
            forecastsHourly: widget.getForecastsHourly(),
            forecasts: widget.getForecasts(),)
        : LocationWidget(widget: widget));
  }
}

class ForecastWidget extends StatefulWidget {
  final UserLocation location;
  final List<WeatherForecast> forecastsHourly;
  final List<WeatherForecast> forecasts;

  const ForecastWidget({
    Key? key,
    required this.location,
    required this.forecasts,
    required this.forecastsHourly,
  }) : super(key: key);

  @override
  State<ForecastWidget> createState() => _ForecastWidgetState();
}

class _ForecastWidgetState extends State<ForecastWidget> {
  WeatherForecast? selectedHourlyForecast;

  void updateCurrentForecast(WeatherForecast forecast) {
    setState(() {
      selectedHourlyForecast = forecast;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            CurrentForecast(
              location: widget.location,
              selectedHourlyForecast: selectedHourlyForecast,
            ),
            HourlyForecasts(
              forecastsHourly: widget.forecastsHourly,
              onForecastSelected: updateCurrentForecast,
            ),
          ],
        ),
      ),
    );
  }
}
class CurrentForecast extends StatelessWidget {
  final UserLocation location;
  final WeatherForecast? selectedHourlyForecast;

  const CurrentForecast({
    Key? key,
    required this.location,
    required this.selectedHourlyForecast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                if (selectedHourlyForecast != null)
                  TemperatureWidget(forecasts: [selectedHourlyForecast!]),
                LocationTextWidget(location: location),
              ],
            ),
          ),
          Expanded(
            child: DescriptionWidget(
              forecasts: selectedHourlyForecast != null
                  ? [selectedHourlyForecast!]
                  : [],
            ),
          ),
        ],
      ),
    );
  }
}


class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
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
        child: Icon(iconData, size: 75, color: iconColor),
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
