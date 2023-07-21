import './condition.dart';

class Day {
  final double maxtempC;
  final double maxtempF;
  final double mintempC;
  final double mintempF;
  final double avgtempC;
  final double avgtempF;
  // final double maxwindMph;
  // final double maxwindKph;
  // final double totalprecipMm;
  // final double totalprecipIn;
  // final double totalsnowCm;
  // final double avgvisKm;
  // final double avgvisMiles;
  // final double avghumidity;
  // final int dailyWillItRain;
  // final int dailyChanceOfRain;
  // final int dailyWillItSnow;
  // final int dailyChanceOfSnow;
  final Condition condition;
  // final double uv;

  Day({
    required this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.mintempF,
    required this.avgtempC,
    required this.avgtempF,
    // required this.maxwindMph,
    // required this.maxwindKph,
    // required this.totalprecipMm,
    // required this.totalprecipIn,
    // required this.totalsnowCm,
    // required this.avgvisKm,
    // required this.avgvisMiles,
    // required this.avghumidity,
    // required this.dailyWillItRain,
    // required this.dailyChanceOfRain,
    // required this.dailyWillItSnow,
    // required this.dailyChanceOfSnow,
    required this.condition,
    // required this.uv,
  });
}
