import 'package:cs492_weather_app/components/weatherScreen/daily_forecasts.dart';
import 'package:cs492_weather_app/components/weatherScreen/hourly_forecasts.dart';
import 'package:cs492_weather_app/models/weather_forecast.dart';
import '../../models/user_location.dart';
import 'package:flutter/material.dart';
import 'package:cs492_weather_app/widgets/set_location.dart';
import 'package:cs492_weather_app/widgets/location_text.dart';
import 'package:cs492_weather_app/widgets/icon.dart';
import 'package:cs492_weather_app/widgets/temperature_text.dart';

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
  bool showHourlyForecast = true; // Flag to track whether to show hourly or daily forecast

  void updateCurrentForecast(WeatherForecast forecast) {
    setState(() {
      selectedHourlyForecast = forecast;
    });
  }

  void toggleForecastType() {
    setState(() {
      showHourlyForecast = !showHourlyForecast;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.forecastsHourly.isNotEmpty) {
      selectedHourlyForecast = widget.forecastsHourly[0];
    }
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
            ElevatedButton(
              onPressed: toggleForecastType,
              child: Text(showHourlyForecast ? 'Show Daily Forecast' : 'Show Hourly Forecast'),
            ),
            if (showHourlyForecast)
              HourlyForecasts(
                forecastsHourly: widget.forecastsHourly,
                onForecastSelected: updateCurrentForecast,
              ),
            if (!showHourlyForecast)
              DailyForecasts(
                forecasts: widget.forecasts,
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
            child: IconWidget(
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









