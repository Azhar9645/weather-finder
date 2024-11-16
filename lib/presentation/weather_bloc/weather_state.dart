part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoadingState extends WeatherState {}

final class WeatherSuccessState extends WeatherState {
  final Weather weather;

  WeatherSuccessState(this.weather);
}

final class WeatherErrorState extends WeatherState {}

