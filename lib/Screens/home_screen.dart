import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/app_drawer.dart';
import '../widget/daily_astro.dart';
import 'package:weather_project/widget/weather_property.dart';

import '../Provider/forecast_days.dart';
import '../widget/current_weather.dart';
import '../widget/todays_weather_card.dart';
import '../widget/weekly_weather_card.dart';
import '../Provider/current_weather.dart';
import '../model/hour.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isInit = true;
  Future<void> _refershPage(BuildContext ctx) async {
    await Provider.of<CurrentsWeather>(ctx, listen: false).fetchAndSet();
    await Provider.of<ForecastDays>(ctx, listen: false).fetchAndSet();
  }

  Drawer show() {
    return Drawer();
  }

  // @override
  // void didChangeDependencies() {
  //   if (isInit) {
  //     Provider.of<ForecastDays>(context, listen: false).fetchAndSet();
  //     isInit = false;
  //   }
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ForecastDays(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.onSecondary,
                )),
          ],
        ),
        drawer: AppDrawer(),
        body: RefreshIndicator(
          onRefresh: () => _refershPage(context),
          child: FutureBuilder(
            future:
                Provider.of<ForecastDays>(context, listen: false).fetchAndSet(),
            builder: (context, snapshot) => snapshot.connectionState ==
                    ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : Stack(
                    children: [
                      Consumer<ForecastDays>(
                        builder: (context, forecast, child) => Container(
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage(forecast.setbackgroundImg(100)),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.black38,
                        height: MediaQuery.of(context).size.height,
                        child: ListView(
                          children: [
                            const SizedBox(
                              height: 100,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     IconButton(
                            //         onPressed: () => show,
                            //         icon: Icon(
                            //           Icons.menu,
                            //           color: Theme.of(context)
                            //               .colorScheme
                            //               .onSecondary,
                            //         )),
                            //     IconButton(
                            //         onPressed: () {},
                            //         icon: Icon(
                            //           Icons.add,
                            //           color: Theme.of(context)
                            //               .colorScheme
                            //               .onSecondary,
                            //         )),
                            //   ],
                            // ),
                            CurrentWeather(),
                            const SizedBox(
                              height: 20,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            // TodaysWeatherCard(),
                            const SizedBox(
                              height: 15,
                            ),
                            WeeklyWeatherCard(),
                            const SizedBox(
                              height: 15,
                            ),
                            WeatherProperty(),
                            const SizedBox(
                              height: 15,
                            ),
                            const DailyAstro(),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
