import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/forecast_days.dart';

class MaxMin extends StatelessWidget {
  const MaxMin({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<ForecastDays>(context).fetchAndSet(),
      builder: (context, snapshot) =>
          Consumer<ForecastDays>(builder: (context, toDay, child) {
        return Text(
          '${toDay.toDay.day.mintempC} \u00B0C / ${toDay.toDay.day.maxtempC}\u00B0C feels like ${toDay.toDay.day.avgtempC} \u00B0C',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
        );
      }),
    );
  }
}
