import 'package:bw_machine_task2/data/models/weather_model.dart';
import 'package:bw_machine_task2/generated/l10n.dart';
import 'package:bw_machine_task2/presentation/screens/display_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting();
  });

  testWidgets('DisplayScreen renders correctly with weather data',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          S.delegate, // Add this
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'), // Add supported locales
          // Add other locales if needed
        ],
        home: DisplayScreen(
          weather: Weather(
            datetime: DateTime.now().toString(),
            sunRise: DateTime.now().toString(),
            sunSet: DateTime.now().toString(),
            maxTemp: 30.0,
            minTemp: 20.0,
            cityName: 'Test City',
            temperature: 25.0,
            mainCondition: 'Clear',
          ),
        ),
      ),
    );

    // Verify if the city name is displayed
    expect(find.text('Test City'), findsOneWidget);

    // Verify if the temperature is displayed
    expect(find.text('25°C'), findsOneWidget);

    // Verify if the weather condition is displayed (localized text should be here)
    expect(find.text('Clear'), findsOneWidget);

    // Verify if the animation is loaded
    expect(find.byType(Lottie), findsOneWidget);

    // Verify if the formatted date is displayed
    final formattedDate =
        DateFormat('EEEE, MMMM dd, yyyy').format(DateTime.now());
    expect(find.text(formattedDate), findsOneWidget);
  });
}
