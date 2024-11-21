import 'package:bw_machine_task2/data/models/weather_model.dart';
import 'package:bw_machine_task2/generated/l10n.dart';
import 'package:bw_machine_task2/presentation/widgets/display_header.dart';
import 'package:bw_machine_task2/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class DisplayScreen extends StatefulWidget {
  final Weather weather;

  const DisplayScreen({super.key, required this.weather});

  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  Locale _locale = const Locale('en');

  void _changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(widget.weather.datetime);
    String formattedDate =
        DateFormat('EEEE, MMMM dd, yyyy', _locale.toString()).format(dateTime);
    String currentTime =
        DateFormat('hh:mm a', _locale.toString()).format(DateTime.now());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            kHeight40,
            /// Builds the header with home, current time, and language selector.
            DisplayHeader(
              currentTime: currentTime,
              onLanguageChange: _changeLanguage,
            ),
            kHeight20,
            Text(
              widget.weather.cityName,
              style: q50W,
            ),
            Text(formattedDate, style: q22W),
            Text('${widget.weather.temperature.round()}°C', style: q150W),
            Lottie.asset(getWeatherAnimation(widget.weather.mainCondition)),
            kHeight20,
            Text(
              widget.weather.mainCondition,
              style: q40W,
            ),
          ],
        ),
      ),
    );
  }

// Helper function to get the appropriate animation for each weather condition
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
}
