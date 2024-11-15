import 'package:bw_machine_task2/presentation/screens/display_screen.dart';
import 'package:bw_machine_task2/presentation/viewmodel/weather_bloc/weather_bloc.dart';
import 'package:bw_machine_task2/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
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
              SizedBox(
                height: 60.h,
                child: CupertinoTextField(
                  controller: _searchController,
                  placeholder: 'Search City Name',
                  decoration: BoxDecoration(
                    color: kGrey,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  suffix: GestureDetector(
                    onTap: () {
                      _searchController.clear();
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(
                        CupertinoIcons.xmark_circle_fill,
                        color: Color(0xFF9E9E9E),
                        size: 35,
                      ),
                    ),
                  ),
                  style: j18Bb,
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                ),
              ),
              kHeight20,
              GestureDetector(
                onTap: () {
                  BlocProvider.of<WeatherBloc>(context)
                      .add(FetchWeatherByCityName(_searchController.text));
                },
                child: Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: kGrey,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  alignment: Alignment.center,
                  child: Text('Find Weather', style: j18Bb),
                ),
              ),
              BlocListener<WeatherBloc, WeatherState>(
                listener: (context, state) {
                  if (state is WeatherSuccessState) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DisplayScreen(weather: state.weather),
                      ),
                    );
                  } else if (state is WeatherErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('City not found. Please try again.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                child: Container(), // Empty container to hold BlocListener
              ),
            ],
          ),
        ),
      ),
    );
  }
}
