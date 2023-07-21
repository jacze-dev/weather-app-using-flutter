import 'condition.dart';

class Hour {
  final int timeEpoch;
  final String time;
  final double tempC;
  final double tempF;
  final int isDay;
  final Condition condition;
  final double windKph;
  final String windDir;
  final double pressureMb;
  final double precipMm;
  final int humidity;
  final int cloud;
  final double visKm;
  final double uv;
  // final double windMph;
  // final double precipIn;
  // final double pressureIn;
  // final int windDegree;
  // final double feelslikeC;
  // final double feelslikeF;
  // final double windchillC;
  // final double windchillF;
  // final double heatindexC;
  // final double heatindexF;
  // final double dewpointC;
  // final double dewpointF;
  // final int willItRain;
  // final int chanceOfRain;
  // final int willItSnow;
  // final int chanceOfSnow;
  // final double visMiles;
  // final double gustMph;
  // final double gustKph;
  Hour({
    required this.timeEpoch,
    required this.time,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.humidity,
    required this.cloud,
    required this.windKph,
    required this.visKm,
    required this.windDir,
    required this.pressureMb,
    required this.precipMm,
    required this.uv,
    // required this.windMph,
    // required this.windDegree,
    // required this.pressureIn,
    // required this.precipIn,
    // required this.feelslikeC,
    // required this.feelslikeF,
    // required this.windchillC,
    // required this.windchillF,
    // required this.heatindexC,
    // required this.heatindexF,
    // required this.dewpointC,
    // required this.dewpointF,
    // required this.willItRain,
    // required this.chanceOfRain,
    // required this.willItSnow,
    // required this.chanceOfSnow,
    // required this.visMiles,
    // required this.gustMph,
    // required this.gustKph,
  });
}
