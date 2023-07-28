import 'package:get/get.dart';
import 'package:weather_app/controllers/weather_controller.dart';

WeatherController weatherController = Get.find();

String TextWidget(String weatherCode) {
  if (weatherCode.contains('1000')) {
    return 'Clear';
    } else if (weatherCode.contains('1001')) {
      return 'Cloudy';
    } else if (weatherCode.contains('1100')) {
      return 'Mostly Clear';
    } else if (weatherCode.contains('1101')) {
      return 'Partly Cloudy';
    } else if (weatherCode.contains('1102')) {
      return 'Mostly Cloudy';
    } else if (weatherCode.contains('2000')) {
      return 'Fog';
    } else if (weatherCode.contains('2100')) {
      return 'Light Fog';
    } else if (weatherCode.contains('3000')) {
      return 'Breezy';
    } else if (weatherCode.contains('3001')) {
      return 'Windy';
    } else if (weatherCode.contains('3002')) {
      return 'Strong Wind';
    } else if (weatherCode.contains('4000')) {
      return 'Drizzle';
    } else if (weatherCode.contains('4001')) {
      return 'Rain';
    } else if (weatherCode.contains('4200')) {
      return 'Light Rain';
    } else if (weatherCode.contains('4201')) {
      return 'Heavy Rain';
    } else if (weatherCode.contains('5000')) {
      return 'Snow';
    } else if (weatherCode.contains('5001')) {
      return 'Flurries';
    } else if (weatherCode.contains('5100')) {
      return 'Light Snow';
    } else if (weatherCode.contains('5101')) {
      return 'Heavy Snow';
    } else if (weatherCode.contains('6000')) {
      return 'Freezing Drizzle';
    } else if (weatherCode.contains('6001')) {
      return 'Freezing Rain';
    } else if (weatherCode.contains('6200')) {
      return 'Light Freezing Rain';
    } else if (weatherCode.contains('6201')) {
      return 'Heavy Freezing Rain';
    } else if (weatherCode.contains('7000')) {
      return 'Ice Pellets';
    } else if (weatherCode.contains('7101')) {
      return 'Heavy Ice Pellets';
    } else if (weatherCode.contains('7102')) {
      return 'Light Ice Pellets';
    } else if (weatherCode.contains('8000')) {
      return 'Thunderstorm';
    }
    return 'Unknown';
  }

