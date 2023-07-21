import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_project/helper/MyHttpException.dart';
import 'package:weather_project/model/astro.dart';
import 'package:weather_project/model/condition.dart';
import 'package:weather_project/model/day.dart';
import 'package:weather_project/model/hour.dart';

import '../model/forecast_day.dart';

class ForecastDays with ChangeNotifier {
  List<Forecastday> _days = [];

  var responseData;

  Future<void> fetchAndSet() async {
    final url = Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=a5a739d77b424bf6b9d163430230903&q=addis%20ababa&days=7');
    try {
      final response = await http.get(url);

      if (response.statusCode > 400) {
        throw MyHttpExcepption('unable to load');
      }

      responseData = await jsonDecode(response.body) as Map<String, dynamic>;
      _days = (responseData['forecast']['forecastday'] as List<dynamic>)
          .map((forecast) {
        return Forecastday(
          date: forecast['date'],
          dateEpoch: forecast['date_epoch'],
          day: Day(
            maxtempC: forecast['day']['maxtemp_c'],
            maxtempF: forecast['day']['maxtemp_f'],
            mintempC: forecast['day']['mintemp_c'],
            mintempF: forecast['day']['mintemp_f'],
            avgtempC: forecast['day']['avgtemp_c'],
            avgtempF: forecast['day']['avgtemp_f'],
            // maxwindMph: forecast['day']['maxwind_mph'],
            // maxwindKph: forecast['day']['maxwind_kph'],
            // totalprecipMm: forecast['day']['totalprecip_mm'],
            // totalprecipIn: forecast['day']['totalprecip_in'],
            // totalsnowCm: forecast['day']['totalsnow_cm'],
            // avgvisKm: forecast['day']['avgvis_km'],
            // avgvisMiles: forecast['day']['avgvis_miles'],
            // avghumidity: forecast['day']['avghumidity'],
            // dailyWillItRain: forecast['day']['daily_will_it_rain'],
            // dailyChanceOfRain: forecast['day']['daily_chance_of_rain'],
            // dailyWillItSnow: forecast['day']['daily_will_it_snow'],
            // dailyChanceOfSnow: forecast['day']['daily_chance_of_snow'],
            condition: Condition(
                text: forecast['day']['condition']['text'],
                icon: forecast['day']['condition']['icon'],
                code: forecast['day']['condition']['code']),
            // uv: forecast['day']['uv'],
          ),
          astro: Astro(
            sunrise: forecast['astro']['sunrise'],
            sunset: forecast['astro']['sunset'],
            moonrise: forecast['astro']['moonrise'],
            moonset: forecast['astro']['moonset'],
            moonPhase: forecast['astro']['moon_phase'],
            moonIllumination: forecast['astro']['moon_illumination'],
            isMoonUp: forecast['astro']['is_moon_up'],
            isSunUp: forecast['astro']['is_sun_up'],
          ),
          hour: (forecast['hour'] as List).map((hour) {
            return Hour(
              timeEpoch: hour['time_epoch'],
              time: hour['time'],
              tempC: hour['temp_c'],
              tempF: hour['temp_f'],
              isDay: hour['is_day'],
              condition: Condition(
                text: hour['condition']['text'],
                icon: hour['condition']['icon'],
                code: hour['condition']['code'],
              ),
              // windMph: hour['wind_mph'],
              windKph: hour['wind_kph'],
              // windDegree: hour['wind_degree'],
              windDir: hour['wind_dir'],
              pressureMb: hour['pressure_mb'],
              // pressureIn: hour['pressure_in'],
              precipMm: hour['precip_mm'],
              // precipIn: hour('precip_in'),
              humidity: hour['humidity'],
              cloud: hour['cloud'],
              // feelslikeC: hour['feelslike_c'],
              // feelslikeF: hour['feelslike_f'],
              // windchillC: hour['windchill_c'],
              // windchillF: hour['windchill_f'],
              // heatindexC: hour['heatindex_c'],
              // heatindexF: hour['heatindex_f'],
              // dewpointC: hour['dewpoint_c'],
              // dewpointF: hour['dewpoint_f'],
              // willItRain: hour['will_it_rain'],
              // chanceOfRain: hour['chance_of_rain'],
              // willItSnow: hour['will_it_snow'],
              // chanceOfSnow: hour['chance_of_snow'],
              visKm: hour['vis_km'],
              // visMiles: hour['vis_miles'],
              // gustMph: hour['gust_mph'],
              // gustKph: hour['gust_kph'],
              uv: hour['uv'],
            );
          }).toList(),
        );
      }).toList();
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  List<Forecastday> get days {
    return [..._days];
  }

  Forecastday get toDay {
    return days.firstWhere(
      (item) => item.date == DateTime.now().toString().substring(0, 10),
    );
  }

  Hour get timeOfDay {
    return toDay.hour.firstWhere((hour) =>
        hour.time.substring(0, 14) ==
        DateTime.now().toString().substring(0, 14));
  }

  String setbackgroundImg(int cloud) {
    if (cloud > 80) {
      return 'assets/images/cloudy.jpg';
    }
    if (cloud > 60) {
      return 'assets/images/partial_cloudy.jpg';
    }
    if (cloud > 40) {
      return 'assets/images/partial_cloudy2.jpg';
    }
    if (cloud > 20) {
      return 'assets/images/sunny1.jpg';
    }
    if (cloud > 10) {
      return 'assets/images/sunny1.jpg';
    } else {
      return 'assets/images/sunny.jpg';
    }
  }
}
