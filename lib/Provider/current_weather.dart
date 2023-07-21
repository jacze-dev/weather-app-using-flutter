import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_project/helper/location_helper.dart';
import 'package:weather_project/model/condition.dart';
import 'package:weather_project/model/weather_location.dart';

import '../model/current.dart';

class CurrentsWeather with ChangeNotifier {
  var current;
  var weatherLocation;

  final url = Uri.parse(
      'http://api.weatherapi.com/v1/current.json?key=a5a739d77b424bf6b9d163430230903&q=Addis Ababa');
  var currents;
  Future<void> fetchAndSet() async {
    try {
      var response = await http.get(url);

      currents = await json.decode(response.body);
      current = Current(
        lastUpdatedEpoch: currents['current']['last_updated_epoch'],
        lastUpdated: currents['current']['last_updated'],
        tempC: currents['current']['temp_c'],
        tempF: currents['current']['temp_f'],
        isDay: currents['current']['is_day'],
        condition: Condition(
            text: currents['current']['condition']['text'],
            icon: currents['current']['condition']['icon'],
            code: currents['current']['condition']['code']),
        windMph: currents['current']['wind_mph'],
        windKph: currents['current']['wind_kph'],
        windDegree: currents['current']['wind_degree'],
        windDir: currents['current']['wind_dir'],
        pressureMb: currents['current']['pressure_mb'],
        pressureIn: currents['current']['pressure_in'],
        precipMm: currents['current']['precip_mm'],
        precipIn: currents['current']['precip_in'],
        humidity: currents['current']['humidity'],
        cloud: currents['current']['cloud'],
        feelslikeC: currents['current']['feelslike_c'],
        feelslikeF: currents['current']['feelslike_f'],
        visKm: currents['current']['vis_km'],
        visMiles: currents['current']['vis_miles'],
        uv: currents['current']['uv'],
        gustMph: currents['current']['gust_mph'],
        gustKph: currents['current']['gust_kph'],
      );

      weatherLocation = WeatherLocation(
        name: currents['location']['name'],
        region: currents['location']['region'],
        country: currents['location']['country'],
        lat: currents['location']['lat'],
        lon: currents['location']['lon'],
        tzId: currents['location']['tz_id'],
        localtimeEpoch: currents['location']['localtime_epoch'],
        localtime: currents['location']['localtime'],
      );
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Current get getCurrent {
    return current;
  }

  WeatherLocation get getLocation {
    return weatherLocation;
  }
}
