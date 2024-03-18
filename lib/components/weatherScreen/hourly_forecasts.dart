import 'package:flutter/material.dart';
import 'package:cs492_weather_app/models/weather_forecast.dart';
import 'package:intl/intl.dart';

// class HourlyForecasts extends StatefulWidget {
//   final List<WeatherForecast> forecastsHourly;

//   const HourlyForecasts({super.key, required this.forecastsHourly});

//   @override
//   State<HourlyForecasts> createState() => _HourlyForecastsState();
// }

class HourlyForecasts extends StatelessWidget {
  final List<WeatherForecast> forecastsHourly;
  final Function(WeatherForecast) onForecastSelected;

  const HourlyForecasts({
    Key? key,
    required this.forecastsHourly,
    required this.onForecastSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6, 
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: forecastsHourly.length,
        itemBuilder: (context, index) {
          DateTime forecastTime = DateTime.now().add(Duration(hours: index));

          String formattedTime = DateFormat('EEEE h:mm a').format(forecastTime);
          return GestureDetector(
            onTap: () {
              onForecastSelected(forecastsHourly[index]);
            },
            child: Card(
              child: ListTile(
                title: Text(formattedTime),
                subtitle: Text(forecastsHourly[index].shortForecast),
                trailing: Text('${forecastsHourly[index].temperature}°F', style: Theme.of(context).textTheme.displaySmall),
              ),
            ),
          );
        },
      ),
    );
  }
}