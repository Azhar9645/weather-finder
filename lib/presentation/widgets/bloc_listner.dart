import 'package:bw_machine_task2/presentation/screens/display_screen.dart';
import 'package:bw_machine_task2/presentation/weather_bloc/weather_bloc.dart';
import 'package:bw_machine_task2/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WeatherBlocListener extends StatelessWidget {
  const WeatherBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeatherBloc, WeatherState>(
      listener: (context, state) {
        if (state is WeatherSuccessState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DisplayScreen(weather: state.weather),
            ),
          );
        } else if (state is WeatherErrorState) {
          Fluttertoast.showToast(
            msg: "City not found. Please try again.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: kRed,
            textColor: kWhite,
            fontSize: 18,
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}