import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:weather_app/controllers/weather_controller.dart';
import 'package:weather_app/screens/days_screen.dart';
import 'package:weather_app/screens/home_screen1.dart';
import 'package:weather_app/screens/search_screen.dart';
import './screens/welcome_screen.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  WeatherController weatherController = Get.put(WeatherController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        //primaryColor: const Color(0xFF4561DB),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color.fromARGB(255, 0, 0, 0),
          onPrimary: Color(0xFFF2F2F2),
          secondary: Color(0xFF0C1A6C),
          onSecondary: Color(0xFFF2F2F2),
          error: Color.fromARGB(255, 255, 0, 0),
          onError: Color.fromARGB(255, 255, 255, 255),
          background: Color(0xFF0C1A6C),
          onBackground: Color(0xFFF2F2F2),
          surface: Color(0xFF4561DB),
          onSurface: Color(0xFFF2F2F2),
        ),
       // textTheme: TextTheme().copyWith()
      ),
      home: WelcomeScreen(),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SearchScreen.routeName: (context) => SearchScreen(),
        HomeScreen1.routeName: (context) => HomeScreen1(),
        DaysScreen.routeName: (context) => DaysScreen(),
      },
      builder: EasyLoading.init(),
    );
  }
}
