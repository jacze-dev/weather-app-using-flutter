import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_icons/weather_icons.dart';

import '../Provider/forecast_days.dart';

class DailyAstro extends StatelessWidget {
  const DailyAstro({super.key});
  IconData iconSelector(String moonPhase) {
    switch (moonPhase) {
      case 'New Moon':
        return WeatherIcons.moon_new;
      case 'Waxing Cresent':
        return WeatherIcons.moon_waning_crescent_3;
      case 'First Quarter':
        return WeatherIcons.moon_first_quarter;
      case 'Waxing Gibbous':
        return WeatherIcons.moon_waxing_gibbous_3;
      case 'Full Moon':
        return WeatherIcons.moon_full;
      case 'Waning Gibbous':
        return WeatherIcons.moon_waning_gibbous_3;
      case 'Last Quarter':
        return WeatherIcons.moon_third_quarter;
      case 'Waning Crescent':
        return WeatherIcons.moon_waning_crescent_3;
      default:
        WeatherIcons.moon_alt_full;
    }
    return WeatherIcons.alien;
  }

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
          Container(
        width: double.infinity,
        // height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.background,
        ),
        padding: const EdgeInsets.all(20),
        child: Consumer<ForecastDays>(
          builder: (context, forecast, child) => Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(
                      WeatherIcons.sunrise,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Sunrise')
                  ],
                ),
                Text(forecast.toDay.astro.sunrise),
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
                      WeatherIcons.sunset,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Sunset')
                  ],
                ),
                Text(forecast.toDay.astro.sunset),
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
                      WeatherIcons.moonrise,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Moon rise'),
                  ],
                ),
                Text(forecast.toDay.astro.moonrise),
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
                      WeatherIcons.moonset,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Moon set')
                  ],
                ),
                Text(forecast.toDay.astro.moonset),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      iconSelector(forecast.toDay.astro.moonPhase),
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text('Moon phase')
                  ],
                ),
                Text(forecast.toDay.astro.moonPhase),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
