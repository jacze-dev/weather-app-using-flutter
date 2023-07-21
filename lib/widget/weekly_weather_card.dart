import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../Provider/forecast_days.dart';

class WeeklyWeatherCard extends StatelessWidget {
  const WeeklyWeatherCard({super.key});

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
              itemCount: forcast.days.length,
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
                        DateFormat.EEEE()
                            .format(DateTime.parse(forcast.days[inx].date))
                            .substring(0, 3),
                        style: const TextStyle(color: Colors.white),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'https:${(forcast.days[inx].day.condition.icon)}'),
                          ),
                        ),
                      ),
                      Text('${forcast.days[inx].day.avgtempC} \u00B0')
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
