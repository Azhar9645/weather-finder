import 'package:bw_machine_task2/data/models/weather_model.dart';
import 'package:bw_machine_task2/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class DisplayScreen extends StatelessWidget {
  final Weather weather;

  const DisplayScreen({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    // Convert the datetime string to a DateTime object
    DateTime dateTime = DateTime.parse(weather.datetime);

    // Format the date as "Tuesday, January 10, 2024"
    String formattedDate = DateFormat('EEEE, MMMM dd, yyyy').format(dateTime);

    // Get the current time in a specific format
    String currentTime = DateFormat('hh:mm a').format(DateTime.now());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            kHeight40,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 35,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Center(
                  child: Text(currentTime, style: q20W),
                ),
                PopupMenuButton<String>(
                  onSelected: (String value) {
                    print('Selected Language: $value');
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem<String>(
                        value: 'English',
                        child: Text('English'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Arabic',
                        child: Text('Arabic'),
                      ),
                    ];
                  },
                  icon: const Icon(
                    Icons.language,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ],
            ),
            kHeight20,
            Text(weather.cityName, style: q50W),
            Text(formattedDate, style: q22W),
            Text('${weather.temperature.round()}°C', style: q150W),
            Lottie.asset(
              getWeatherAnimation(
                weather.mainCondition,
              ),
            ),
            kHeight20,
            Text(weather.mainCondition, style: q40W),
          ],
        ),
      ),
    );
  }
}

String getWeatherAnimation(String mainCondition) {
  switch (mainCondition.toLowerCase()) {
    case 'clouds':
    case 'mist':
    case 'smoke':
    case 'haze':
    case 'dust':
    case 'fog':
      return 'assets/lottie/condiotions/windy.json';
    case 'rain':
    case 'drizzle':
    case 'shower rain':
      return 'assets/lottie/condiotions/sun with rain.json';
    case 'thunderstorm':
      return 'assets/lottie/condiotions/thunder.json';
    case 'clear':
      return 'assets/lottie/condiotions/sunny.json';
    default:
      return 'assets/lottie/condiotions/sunny.json';
  }
}
