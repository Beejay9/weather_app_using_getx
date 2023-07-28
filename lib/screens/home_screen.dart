// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/controllers/weather_controller.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/widgets/image_widget.dart';
import 'package:weather_app/widgets/text_widget.dart';
//import 'package:weather_icons/weather_icons.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static const routeName = '/homeScreen';
  WeatherController weatherController = Get.find();

  //Locale loc = Locale('', 'NG');
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: Theme.of(context).colorScheme.primary,
                elevation: 10,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        textAlign: TextAlign.start,
                        DateFormat.MMMMEEEEd().format(DateTime.now()),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        //  const SizedBox(width: 5,),
                        Text(
                          '${weatherController.userWeather[0].city}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 29,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 250,
                      child: ImageWidget(
                        weatherController.userWeather[0].main!.toString(),
                        weatherController.userWeather[0].time!.toInt(),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text(
                          '${weatherController.userWeather[0].temp}'
                          '${String.fromCharCodes(Runes('\u00b0'))}',
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      TextWidget(weatherController.userWeather[0].main!.toString()),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(15),
                                margin: const EdgeInsets.all(5),
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                                child: Image.asset('assets/18.png'),
                              ),
                              Text(
                                '${weatherController.userWeather[0].wind!}Km/h',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(15),
                                margin: const EdgeInsets.all(5),
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                                child: Image.asset('assets/17.png'),
                              ),
                              Text(
                                '${weatherController.userWeather[0].humidity}%',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(15),
                                margin: const EdgeInsets.all(5),
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                                child: Image.asset('assets/16.png'),
                              ),
                              Text(
                                '${weatherController.userWeather[0].visibility}km',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Today',
                      style: TextStyle(
                        // color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      child: const Text('Next 7 days >'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 50,
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 8.0,
                          left: 8,
                        ),
                        child: Card(
                          shape: StadiumBorder(),
                          color: Theme.of(context).colorScheme.primary,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${weatherController.userWeather[index].time}:00',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                ImageWidget(
                                  weatherController.userWeather[index].main!,
                                  weatherController.userWeather[index].time!
                                      .toInt(),
                                ),
                                Text(
                                  '${weatherController.userWeather[index].temp}'
                                  '${String.fromCharCodes(Runes('\u00b0'))}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 6,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(SearchScreen.routeName);
        },
       backgroundColor: Theme.of(context).colorScheme.onPrimary,
        child: Icon(
          Icons.search,
          color: Theme.of(context).colorScheme.primary,
          size: 35,
        ),
      ),
    );
  }
}
