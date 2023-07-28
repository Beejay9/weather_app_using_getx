import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controllers/weather_controller.dart';

class ImageWidget extends StatelessWidget {
  final String weatherCode;
  final int userTime;
  ImageWidget(this.weatherCode, this.userTime);
  //WeatherController weatherController = Get.find();
  @override
  Widget build(BuildContext context) {
    if (weatherCode.contains('1000') ||
        weatherCode.contains('1100') && userTime > 0 && userTime <= 5) {
      return Image.asset('assets/35.png');
    } else if (weatherCode.contains('1000') ||
        weatherCode.contains('1100') && userTime > 5 && userTime <= 9) {
      return Image.asset('assets/17.png');
    } else if (weatherCode.contains('1000') ||
        weatherCode.contains('1100') && userTime > 9 && userTime <= 18) {
      return Image.asset('assets/26.png');
    } else if (weatherCode.contains('1000') ||
        weatherCode.contains('1100') && userTime > 18 && userTime <= 23) {
      return Image.asset('assets/10.png');
    } else if (weatherCode.contains('1001')) {
      return Image.asset('assets/35.png');
    } else if (weatherCode.contains('1101') && userTime > 0 && userTime <= 5) {
      return Image.asset('assets/31.png');
    } else if (weatherCode.contains('1101') && userTime > 5 && userTime <= 9) {
      return Image.asset('assets/35.png');
    } else if (weatherCode.contains('1101') && userTime > 9 && userTime <= 18) {
      return Image.asset('assets/27.png');
    } else if (weatherCode.contains('1101') &&
        userTime > 18 &&
        userTime <= 23) {
      return Image.asset('assets/32.png');
    } else if (weatherCode.contains('1102')) {
      return Image.asset('assets/35.png');
    } else if (weatherCode.contains('3000') && userTime > 0 && userTime <= 5) {
      return Image.asset('assets/9.png');
    } else if (weatherCode.contains('3000') && userTime > 5 && userTime <= 9) {
      return Image.asset('assets/6.png');
    } else if (weatherCode.contains('3000') && userTime > 9 && userTime <= 18) {
      return Image.asset('assets/6.png');
    } else if (weatherCode.contains('3000') &&
        userTime > 18 &&
        userTime <= 23) {
      return Image.asset('assets/9.png');
    } else if (weatherCode.contains('3001') ||
        weatherCode.contains('3002') && userTime > 0 && userTime <= 5) {
      return Image.asset('assets/14.png');
    } else if (weatherCode.contains('3001') ||
        weatherCode.contains('3002') && userTime > 5 && userTime <= 9) {
      return Image.asset('assets/35.png');
    } else if (weatherCode.contains('3001') ||
        weatherCode.contains('3002') && userTime > 9 && userTime <= 18) {
      return Image.asset('assets/4.png');
    } else if (weatherCode.contains('3001') ||
        weatherCode.contains('3002') && userTime > 18 && userTime <= 23) {
      return Image.asset('assets/14.png');
    } else if (weatherCode.contains('4000') || weatherCode.contains('4200')) {
      return Image.asset('assets/39.png');
    } else if (weatherCode.contains('4001') && userTime > 0 && userTime <= 5) {
      return Image.asset('assets/2.1.png');
    } else if (weatherCode.contains('4001') && userTime > 5 && userTime <= 9) {
      return Image.asset('assets/7.png');
    } else if (weatherCode.contains('4001') && userTime > 9 && userTime <= 18) {
      return Image.asset('assets/8.png');
    } else if (weatherCode.contains('4001') &&
        userTime > 18 &&
        userTime <= 23) {
      return Image.asset('assets/2.1.png');
    } else if (weatherCode.contains('4201') && userTime > 0 && userTime <= 5) {
      return Image.asset('assets/1.png');
    } else if (weatherCode.contains('4201') && userTime > 5 && userTime <= 9) {
      return Image.asset('assets/5.png');
    } else if (weatherCode.contains('4201') && userTime > 9 && userTime <= 18) {
      return Image.asset('assets/13.png');
    } else if (weatherCode.contains('4201') &&
        userTime > 17 &&
        userTime <= 23) {
      return Image.asset('assets/1.png');
    } else if (weatherCode.contains('5000') || weatherCode.contains('5100')) {
      return Image.asset('assets/36.png');
    } else if (weatherCode.contains('5101')) {
      return Image.asset('assets/23.png');
    } else if (weatherCode.contains('6200') ||
        weatherCode.contains('6000') && userTime > 0 && userTime <= 5) {
      return Image.asset('assets/2.png');
    } else if (weatherCode.contains('6200') ||
        weatherCode.contains('6000') && userTime > 5 && userTime <= 9) {
      return Image.asset('assets/5.png');
    } else if (weatherCode.contains('6200') ||
        weatherCode.contains('6000') && userTime > 9 && userTime <= 18) {
      return Image.asset('assets/13.png');
    } else if (weatherCode.contains('6200') ||
        weatherCode.contains('6000') && userTime > 18 && userTime <= 23) {
      return Image.asset('assets/2.png');
    } else if (weatherCode.contains('6201') || weatherCode.contains('6001')) {
      return Image.asset('assets/17.png');
    } else if (weatherCode.contains('8000')) {
      return Image.asset('assets/29.png');
    }
    return Image.asset('assets/38.png');
  }
}
