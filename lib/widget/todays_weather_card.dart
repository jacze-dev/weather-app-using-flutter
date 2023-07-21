import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_project/Provider/current_weather.dart';

import '../Provider/forecast_days.dart';

class TodaysWeatherCard extends StatefulWidget {
  @override
  State<TodaysWeatherCard> createState() => _TodaysWeatherCardState();
}

class _TodaysWeatherCardState extends State<TodaysWeatherCard> {
  // var isInit = true;
  // @override
  // void didChangeDependencies() {
  //   if (isInit) {
  //     Provider.of<ForecastDays>(context, listen: false).fetchAndSet();
  //   }
  //   isInit = false;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<ForecastDays>(context, listen: false).fetchAndSet(),
      builder: (context, snapshot) =>
          // snapshot.connectionState ==
          //         ConnectionState.waiting
          //     ? const Center(
          //         child: LinearProgressIndicator(),
          //       )
          //     :
          Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * .3,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.background,
        ),
        margin: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<ForecastDays>(
            builder: (context, forcast, child) => ListView.builder(
              itemCount: forcast.toDay.hour.length,
              itemBuilder: (ctx, inx) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        forcast.toDay.hour[inx].time.substring(10, 16),
                        style: const TextStyle(color: Colors.white),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('https:' +
                                forcast.toDay.hour[inx].condition.icon),
                          ),
                        ),
                      ),
                      Text('${forcast.toDay.hour[inx].cloud} %'),
                      Text('${forcast.toDay.hour[inx].tempC} \u00B0')
                    ],
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
      ),
    );
  }
}
