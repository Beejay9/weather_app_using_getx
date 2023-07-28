import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
//import 'package:location/location.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/controllers/weather_controller.dart';
import 'package:weather_app/screens/home_screen1.dart';
import 'package:weather_app/screens/search_screen.dart';
import './home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});
  WeatherController weatherController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const SizedBox(
              height: 140,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Lottie.asset('assets/01.json'),
            ),
            const SizedBox(
              height: 100,
            ),
            Expanded(
              child: Container(

                width: Get.width,
                decoration:  BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Find Weather Forecast of Your City and Any City',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(230, 43, 41, 41),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Easy steps to predict the weather and make your day easier',
                        style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 87, 87, 87)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        fixedSize: const Size(160, 55),
                        elevation: 10
                      ),
                      onPressed: EasyLoading.isShow ? null : () async {
                       await weatherController.userLocationWeather();
                        Navigator.of(context)
                            .pushReplacementNamed(HomeScreen1.routeName);
                      },
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
