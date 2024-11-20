import 'package:bw_machine_task2/presentation/weather_bloc/weather_bloc.dart';
import 'package:bw_machine_task2/presentation/widgets/bloc_listner.dart';
import 'package:bw_machine_task2/presentation/widgets/find_weather_button.dart';
import 'package:bw_machine_task2/presentation/widgets/search_field.dart';
import 'package:bw_machine_task2/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {

  HomeScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Lottie.asset(
                'assets/lottie/splash/new.json',
                fit: BoxFit.cover,
              ),
            ),
            kHeight20,
            SearchField(controller: _searchController),
            kHeight20,
            FindWeatherButton(
              onPressed: () {
                BlocProvider.of<WeatherBloc>(context)
                    .add(FetchWeatherByCityName(_searchController.text));
              },
            ),
            const WeatherBlocListener(),
          ],
        ),
      ),
    );
  }
}
