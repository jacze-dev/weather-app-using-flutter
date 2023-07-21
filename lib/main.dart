import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import '../helper/location_helper.dart';
import 'Provider/current_weather.dart';
import './Screens/home_screen.dart';
import './Provider/forecast_days.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    var isNightMode = false;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: LocationHelper(),
        ),
        ChangeNotifierProvider.value(
          value: CurrentsWeather(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ForecastDays(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Lato',
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
            bodyLarge: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
            bodySmall: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          colorScheme: const ColorScheme.light(
              background: Colors.black54,
              primary: Colors.green,
              secondary: Color.fromARGB(255, 155, 219, 127),
              onPrimary: Color.fromARGB(255, 254, 254, 254),
              onSecondary: Colors.white),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
