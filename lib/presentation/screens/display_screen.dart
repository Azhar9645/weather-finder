import 'package:bw_machine_task2/data/models/weather_model.dart';
import 'package:bw_machine_task2/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            kHeight20,
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
                // Centering the current time in the middle of the icons
                Center(
                  child: Text(
                    currentTime,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                    ),
                  ),
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
            kHeight10,
            Text(
              '${weather.cityName}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 45.sp,
              ),
            ),
            // Display the formatted date
            Text(
              formattedDate,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
              ),
            ),
            Text(
              '${weather.temperature.round()}°C',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 80.sp,
              ),
            ),
            Lottie.asset(
              getWeatherAnimation(
                weather.mainCondition.toUpperCase(),
              ),
            ),
            kHeight10,
            Text(
              '${weather.mainCondition}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 30.sp,
              ),
            ),
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
