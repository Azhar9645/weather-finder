import 'package:bloc/bloc.dart';
import 'package:bw_machine_task2/data/models/weather_model.dart';
import 'package:bw_machine_task2/data/services/weather_service.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherService weatherService;

  WeatherBloc(this.weatherService) : super(WeatherInitial()) {
    on<FetchWeatherByCityName>((event, emit) async {
      emit(WeatherLoadingState());
      try {
        final weather =
            await weatherService.fetchWeatherByCityName(event.cityName);
        if (weather != null) {
          emit(WeatherSuccessState(weather));
          print('City: ${weather.cityName}');
        } else {
          emit(WeatherErrorState());
        }
      } catch (e) {
        emit(WeatherErrorState());
      }
    });
  }
}
