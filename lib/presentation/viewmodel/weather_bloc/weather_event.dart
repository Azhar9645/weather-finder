part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

class FetchWeatherByCityName extends WeatherEvent {
  final String cityName;

  FetchWeatherByCityName(this.cityName);
}
