import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_icons/weather_icons.dart';
import '../Provider/forecast_days.dart';

class WeatherProperty extends StatelessWidget {
  const WeatherProperty({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<ForecastDays>(context, listen: false).fetchAndSet(),
      builder: (context, snapshot) =>
          // snapshot.connectionState == ConnectionState.waiting
          //     ? const Center(
          //         child: LinearProgressIndicator(),
          //       )
          //     :
          Consumer<ForecastDays>(
        builder: (context, weather, child) => Container(
          width: double.infinity,
          // height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.background,
          ),
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(
                      WeatherIcons.humidity,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Humidity')
                  ],
                ),
                Text('${weather.timeOfDay.humidity} %'),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(
                      WeatherIcons.barometer,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Pressure')
                  ],
                ),
                Text('${weather.timeOfDay.pressureMb} mb'),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(
                      WeatherIcons.strong_wind,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Wind Speed'),
                  ],
                ),
                Text('${weather.timeOfDay.windKph} kph'),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(
                      WeatherIcons.wind_direction,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Wind direction')
                  ],
                ),
                Text(weather.timeOfDay.windDir),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.visibility,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Visibility')
                  ],
                ),
                Text('${weather.timeOfDay.visKm} km'),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(
                      WeatherIcons.day_sunny,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('UV index')
                  ],
                ),
                Text('${weather.timeOfDay.uv} mb'),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
