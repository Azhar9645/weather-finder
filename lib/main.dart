import 'package:bw_machine_task2/data/services/weather_service.dart';
import 'package:bw_machine_task2/generated/l10n.dart';
import 'package:bw_machine_task2/presentation/screens/home_screen.dart';
import 'package:bw_machine_task2/presentation/weather_bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  void _changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(WeatherService()),
      child: Builder(
        builder: (context) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background/203514.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'BW ASS2',
              theme: ThemeData(
                useMaterial3: true,
                scaffoldBackgroundColor: Colors.transparent,
              ),
              locale: _locale,
              supportedLocales: const [
                Locale('en', 'US'),
                Locale('ar', 'AE'),
              ],
              localizationsDelegates: const [
                S.delegate, // The generated delegate
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              home: HomeScreen(),
            ),
          );
        },
      ),
    );
  }
}
