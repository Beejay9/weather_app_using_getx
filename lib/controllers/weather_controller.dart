import 'dart:convert';

//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
//import 'package:location/location.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather.dart';

class WeatherController extends GetxController {
  List<Weather> searchWeather = [];
  List<Weather> userWeather = [];
  List<Weather> daysWeather = [];

  Map<String, dynamic>? lagosWeather = {
    'main': '',
    'wind': '',
    'temp': '',
    'humidity': '',
    'time': '',
  };

  Map<String, dynamic>? newyorkWeather = {
    'main': '',
    'wind': '',
    'temp': '',
    'humidity': '',
    'time': '',
  };

  Map<String, dynamic>? beijingWeather = {
    'main': '',
    'wind': '',
    'temp': '',
    'humidity': '',
    'time': '',
  };

  bool? serviceEnabled;
  LocationPermission? locationPermission;
  Position? position;

  static const String apiKey2 = '7DGa7fcAd7P5WUV6WsVyAzYc3XbGghjs';

  Future<void> fetchCurrentWeather(String cityAndCountry) async {
    try {
      // EasyLoading.instance
      //   ..loadingStyle = EasyLoadingStyle.custom
      //   ..backgroundColor = Colors.white
      //   ..indicatorColor = Colors.black
      //   ..textColor = Colors.black;
      EasyLoading.show(status: 'Loading');
      List<Location> locations = await locationFromAddress(cityAndCountry);
      final lat = locations[0].latitude;
      final lon = locations[0].longitude;

      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
      String cityUrl =
          'https://api.tomorrow.io/v4/timelines?location=$lat,$lon&fields=temperature,windSpeed,weatherCode,visibility,humidity,cloudCover&timesteps=current,1h&timezone=Africa/Lagos&units=metric&apikey=$apiKey2';
      final cityResponse = await http.get(Uri.parse(cityUrl));
      final cityWeatherData = jsonDecode(cityResponse.body)['data']['timelines']
          [0]['intervals'] as List;
      List<Weather> testList = [];
      //print(cityResponse.statusCode);
      //print(cityWeatherData);

      cityWeatherData.forEach(
        (element) {
          testList.add(
            Weather(
              main: element['values']['weatherCode'].toString(),
              temp: element['values']['temperature'].toString(),
              humidity: element['values']['humidity'].toString(),
              wind: element['values']['windSpeed'].toString(),
              visibility: element['values']['visibility'].toString(),
              city: placemarks[0].subAdministrativeArea,
              time: DateTime.parse(element['startTime']).hour,
              country: placemarks[0].country,
              timeZone:
                  DateTime.parse(cityWeatherData[0]['startTime']).timeZoneName,
            ),
          );
        },
      );
      searchWeather = testList;
    } catch (e) {
      Get.snackbar(
        'Oops! An error occured',
        'Something went wrong, but it\'s not your fault, try again!',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 4),
        // backgroundColor: Colors.black,
        // colorText: Colors.white,
        snackStyle: SnackStyle.FLOATING,
      );
    } finally {
      EasyLoading.dismiss();
    }
    // weatherController.searchWeather[0].main;
  }

  Future<void> userLocationWeather() async {
    try {
      EasyLoading.instance
        ..loadingStyle = EasyLoadingStyle.custom
        ..backgroundColor = Colors.white
        ..indicatorColor = Colors.black
        ..textColor = Colors.black;
      EasyLoading.show(status: 'Loading');
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled!) {
        Future.error('error');
        //serviceEnabled = await Geolocator.openLocationSettings();
      }
      locationPermission = await Geolocator.checkPermission();
      if (locationPermission == LocationPermission.denied) {
        locationPermission = await Geolocator.requestPermission();
      }
      if (locationPermission == LocationPermission.denied) {
        return Future.error('error');
      }
      position = await Geolocator.getCurrentPosition();

      double lat = position!.latitude;
      double lon = position!.longitude;

      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);

      String currentWeatherApi =
          'https://api.tomorrow.io/v4/timelines?location=$lat,$lon&fields=temperature,windSpeed,weatherCode,visibility,humidity,cloudCover&timesteps=current,1h&units=metric&apikey=$apiKey2';
      String daysUrl =
          'https://api.tomorrow.io/v4/timelines?location=$lat,$lon&fields=temperature,windSpeed,weatherCode,visibility,humidity,cloudCover&timesteps=1d&timezone=Africa/Lagos&units=metric&apikey=$apiKey2';

      final weatherResponse = await http.get(Uri.parse(currentWeatherApi));
      final daysResponse = await http.get(Uri.parse(daysUrl));

      final weatherData = jsonDecode(weatherResponse.body)['data']['timelines']
          [0]['intervals'] as List;

      final daysWeatherData = jsonDecode(daysResponse.body)['data']['timelines']
          [0]['intervals'] as List;

      //print(daysWeatherData);

      List<Weather> testList = [];

      for (var element in weatherData) {
        testList.add(
          Weather(
            main: element['values']['weatherCode'].toString(),
            temp: element['values']['temperature'].toString(),
            humidity: element['values']['humidity'].toString(),
            wind: element['values']['windSpeed'].toString(),
            visibility: element['values']['visibility'].toString(),
            city: placemarks[0].subAdministrativeArea,
            time: DateTime.parse(element['startTime']).toLocal().hour,
            country: placemarks[0].country,
            timeZone: DateTime.parse(weatherData[0]['startTime'])
                .toLocal()
                .timeZoneName,
          ),
        );
      }
      userWeather = testList;

      List<Weather> daysList = [];
      for (var element in daysWeatherData) {
        daysList.add(
          Weather(
            main: element['values']['weatherCode'].toString(),
            temp: element['values']['temperature'].toString(),
            humidity: element['values']['humidity'].toString(),
            wind: element['values']['windSpeed'].toString(),
            visibility: element['values']['visibility'].toString(),
            city: placemarks[0].subAdministrativeArea,
            day: DateFormat.E()
                .format(DateTime.parse(element['startTime']).toLocal()),
            time: DateTime.parse(element['startTime']).toLocal().hour,
            country: placemarks[0].country,
            timeZone: DateTime.parse(weatherData[0]['startTime'])
                .toLocal()
                .timeZoneName,
          ),
        );
      }
      daysList.removeAt(0);
      daysWeather = daysList;
    } catch (e) {
      Get.snackbar(
        'Oops! An error occured',
        'Something went wrong, but it\'s not your fault, try again!',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 4),
        // backgroundColor: Colors.black,
        // colorText: Colors.white,
        snackStyle: SnackStyle.FLOATING,
      );
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> cityWeather() async {
    try {
      EasyLoading.show();

      List<Location> locations1 = await locationFromAddress('Lagos');
      List<Location> locations2 = await locationFromAddress('New York');
      List<Location> locations3 = await locationFromAddress('Beijing');
      final lagosLon = locations1[0].longitude;
      final lagosLat = locations1[0].latitude;

      final newyorkLon = locations2[0].longitude;
      final newyorkLat = locations2[0].latitude;

      final beijingLon = locations3[0].longitude;
      final beijingLat = locations3[0].latitude;

      String lagosWeatherApi =
          'https://api.tomorrow.io/v4/timelines?location=$lagosLat,$lagosLon&fields=temperature,windSpeed,weatherCode,visibility,humidity,cloudCover&timesteps=current,1h&units=metric&apikey=$apiKey2';
      String newyorkWeatherApi =
          'https://api.tomorrow.io/v4/timelines?location=$newyorkLat,$newyorkLon&fields=temperature,windSpeed,weatherCode,visibility,humidity,cloudCover&timesteps=current,1h&units=metric&apikey=$apiKey2';
      String beijingWeatherApi =
          'https://api.tomorrow.io/v4/timelines?location=$beijingLat,$beijingLon&fields=temperature,windSpeed,weatherCode,visibility,humidity,cloudCover&timesteps=current,1h&units=metric&apikey=$apiKey2';

      final lagosResponse = await http.get(Uri.parse(lagosWeatherApi));
      final newyorkResponse = await http.get(Uri.parse(newyorkWeatherApi));
      final beijingResponse = await http.get(Uri.parse(beijingWeatherApi));

      final lagosWeatherData = jsonDecode(lagosResponse.body)['data']
          ['timelines'][0]['intervals'] as List;
      final newyorkWeatherData = jsonDecode(newyorkResponse.body)['data']
          ['timelines'][0]['intervals'] as List;
      final beijingWeatherData = jsonDecode(beijingResponse.body)['data']
          ['timelines'][0]['intervals'] as List;
      //var test = lagosWeatherData[0]['values']['temperature'];
      lagosWeather!['main'] =
          lagosWeatherData[0]['values']['weatherCode'].toString();
      lagosWeather!['wind'] =
          lagosWeatherData[0]['values']['windSpeed'].toString();
      lagosWeather!['temp'] =
          lagosWeatherData[0]['values']['temperature'].toString();
      lagosWeather!['humidity'] =
          lagosWeatherData[0]['values']['humidity'].toString();
      lagosWeather!['time'] =
          DateTime.parse(lagosWeatherData[0]['startTime']).hour;

      newyorkWeather!['main'] =
          newyorkWeatherData[0]['values']['weatherCode'].toString();
      newyorkWeather!['wind'] =
          newyorkWeatherData[0]['values']['windSpeed'].toString();
      newyorkWeather!['temp'] =
          newyorkWeatherData[0]['values']['temperature'].toString();
      newyorkWeather!['humidity'] =
          newyorkWeatherData[0]['values']['humidity'].toString();
      newyorkWeather!['time'] =
          DateTime.parse(newyorkWeatherData[0]['startTime']).hour;

      beijingWeather!['main'] =
          beijingWeatherData[0]['values']['weatherCode'].toString();
      beijingWeather!['wind'] =
          beijingWeatherData[0]['values']['windSpeed'].toString();
      beijingWeather!['temp'] =
          beijingWeatherData[0]['values']['temperature'].toString();
      beijingWeather!['humidity'] =
          beijingWeatherData[0]['values']['humidity'].toString();
      beijingWeather!['time'] =
          DateTime.parse(beijingWeatherData[0]['startTime']).hour;

      //print(lagosWeatherData);
      print('the test is ${lagosWeather!['temp']}');
    } catch (e) {
      Get.snackbar(
        'Oops! An error occured',
        'Something went wrong, but it\'s not your fault, try again!',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 4),
        // backgroundColor: Colors.black,
        // colorText: Colors.white,
        snackStyle: SnackStyle.FLOATING,
      );
    } finally {
      EasyLoading.dismiss();
    }
  }
}
