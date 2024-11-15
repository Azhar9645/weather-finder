import 'package:bw_machine_task2/data/services/weather_service.dart';
import 'package:bw_machine_task2/presentation/screens/home_screen.dart';
import 'package:bw_machine_task2/presentation/viewmodel/weather_bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider(
        create: (context) => WeatherBloc(WeatherService()),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background/203514.jpg'), // path to your background image
              fit: BoxFit.cover,
            ),
            // gradient: LinearGradient(
            //   colors: [
            //     Color(0xBF0B7DD4),
            //     Color(0xFF23796F),
            //     Color(0xFF1B263B),
            //   ],
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            // ),
          ),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'BW ASS2',
            theme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: Colors.transparent,
              textTheme: GoogleFonts.quicksandTextTheme(),
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black),
                titleTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            home: HomeScreen(),
          ),
        ),
      ),
    );
  }
}
