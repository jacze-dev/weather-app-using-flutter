import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../widget/max_min.dart';
import '../Provider/current_weather.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          Provider.of<CurrentsWeather>(context, listen: false).fetchAndSet(),
      builder: (context, snapshot) =>
          // snapshot.connectionState ==
          //         ConnectionState.waiting
          //     ? const Center(
          //         child: CircularProgressIndicator(),
          //       )
          //     :
          Consumer<CurrentsWeather>(
        builder: (context, current, child) {
          return Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(current.getLocation.name,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  current.getLocation.localtime.substring(11, 16),
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https:${current.getCurrent.condition.icon}'),
                              fit: BoxFit.cover)),
                      // d NetworkImage(current.getCurrent.condition.icon),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${current.getCurrent.tempC} \u00B0',
                      style: const TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 80,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                //max min
                // MaxMin(),
                Text(current.getCurrent.condition.text),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Last Updated: ' +
                        DateFormat.yMMMd().format(
                            DateTime.parse(current.getCurrent.lastUpdated)),
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
