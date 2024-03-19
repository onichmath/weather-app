import 'package:flutter/material.dart';
import 'package:cs492_weather_app/models/weather_forecast.dart';
import 'package:intl/intl.dart';

class DailyForecasts extends StatelessWidget {
  final List<WeatherForecast> forecasts;
  final Function(WeatherForecast) onForecastSelected;

  const DailyForecasts({
    Key? key,
    required this.forecasts,
    required this.onForecastSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6, 
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: forecasts.length,
        itemBuilder: (context, index) {
          DateTime forecastTime = DateTime.now().add(Duration(hours: index * 12));

          String formattedTime = DateFormat('EEEE h:mm a').format(forecastTime);
          return InkWell(
            splashColor: Theme.of(context).colorScheme.onBackground.withOpacity(0.25),
            onTap: () {
              onForecastSelected(forecasts[index]);
            },
            child: Card(
              child: ListTile(
                title: Text(formattedTime),
                subtitle: Text(forecasts[index].shortForecast),
                trailing: Text('${forecasts[index].temperature}°F', style: Theme.of(context).textTheme.displaySmall),
              ),
            ),
          );
        },
      ),
    );
  }
}