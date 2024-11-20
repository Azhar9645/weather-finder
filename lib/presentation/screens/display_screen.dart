import 'package:bw_machine_task2/data/models/weather_model.dart';
import 'package:bw_machine_task2/generated/l10n.dart';
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

    // Localize the weather condition
    String localizedCondition =
        _getLocalizedWeatherCondition(widget.weather.mainCondition, context);

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
                  icon: const Icon(Icons.home, color: Colors.white, size: 35),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Center(
                  child: Text(currentTime, style: q20W),
                ),
                PopupMenuButton<String>(
                  onSelected: (String value) {
                    // Change the language based on selected menu item
                    Locale newLocale = value == 'English'
                        ? const Locale('en')
                        : const Locale('ar');
                    _changeLanguage(newLocale);
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem<String>(
                        value: 'English',
                        child: Text(S.of(context).english()),
                      ),
                      PopupMenuItem<String>(
                        value: 'Arabic',
                        child: Text(S.of(context).arabic()),
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
            // City Name
            Text(
              widget.weather.cityName, // No translation for city name needed
              style: q50W,
            ),
            Text(formattedDate, style: q22W),
            Text('${widget.weather.temperature.round()}°C', style: q150W),
            Lottie.asset(getWeatherAnimation(widget.weather.mainCondition)),
            kHeight20,
            // Weather Condition (Localized)
            Text(
              localizedCondition, // Localized condition text
              style: q40W,
            ),
          ],
        ),
      ),
    );
  }

  String _getLocalizedWeatherCondition(String condition, BuildContext context) {
    // Map weather conditions to localized strings
    switch (condition.toLowerCase()) {
      case 'clear':
        return S.of(context).clear(); // Assuming you have this translation in your .arb files
      case 'clouds':
        return S.of(context).clouds();
      case 'rain':
        return S.of(context).rain();
      case 'mist':
        return S.of(context).mist();
      default:
        return S.of(context).unknown_condition();
    }
  }
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
