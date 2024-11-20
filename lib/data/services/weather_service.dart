import 'dart:convert';
import 'package:bw_machine_task2/data/models/weather_model.dart';
import 'package:bw_machine_task2/utils/constants.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  Future<Weather?> fetchWeatherByCityName(String cityName) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric',
        ),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return Weather.fromJson(jsonData);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Failed to fetch weather data: $e');
    }
  }
}
