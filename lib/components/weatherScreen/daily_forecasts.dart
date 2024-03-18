import 'package:flutter/material.dart';
import 'package:cs492_weather_app/models/weather_forecast.dart';
import 'package:intl/intl.dart';

// class DailyForecasts extends StatefulWidget {
//   final List<WeatherForecast> forecasts;

//   const DailyForecasts({super.key, required this.forecasts});

//   @override
//   State<DailyForecasts> createState() => _DailyForecastsState();
// }

// class _DailyForecastsState extends State<DailyForecasts> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width * 0.8,
//       height: MediaQuery.of(context).size.height * 0.3,
//       child: ListView.builder(
//         itemCount: widget.forecasts.length,
//         itemBuilder: (context, index) {
//           return Card(
//             child: ListTile(
//               title: Text(widget.forecasts[index].name),
//               subtitle: Text(widget.forecasts[index].shortForecast),
//               trailing: Text('${widget.forecasts[index].temperature}°F'),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

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
          return GestureDetector(
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