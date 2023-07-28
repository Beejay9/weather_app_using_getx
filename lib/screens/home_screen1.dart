import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controllers/weather_controller.dart';
import 'package:weather_app/screens/days_screen.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/widgets/image_widget.dart';
import 'package:weather_app/widgets/text_widget.dart';

class HomeScreen1 extends StatelessWidget {
  HomeScreen1({super.key});
  static const routeName = '/homeScreen1';
  WeatherController weatherController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   foregroundColor: Theme.of(context).colorScheme.primary,
      //   backgroundColor: Colors.white,
      // ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 15,
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        onPressed: () {
                         Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.exit_to_app_rounded,
                        ),
                        iconSize: 30,
                      ),
                    ),
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(SearchScreen.routeName);
                        },
                        icon: const Icon(
                          Icons.search,
                        ),
                        iconSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 230,
                  child: Card(
                    color: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                DateFormat.MMMMEEEEd().format(
                                  DateTime.now(),
                                ),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                '${weatherController.userWeather[0].time}:00',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                '${weatherController.userWeather[0].city}, '
                                '${weatherController.userWeather[0].country}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                // weatherController.daysWeather[0].temp!.length >
                                //         1
                                //     ? '${weatherController.userWeather[0].temp!.substring(0, 2)}'
                                //         '${String.fromCharCodes(Runes('\u00b0'))}'
                                //     :
                                     '${weatherController.userWeather[0].temp}'
                                        '${String.fromCharCodes(Runes('\u00b0'))}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                TextWidget(
                                  //'1101'
                                  weatherController.userWeather[0].main!
                                      .toString(),
                                ),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ImageWidget(
                              //'1101', 19
                              weatherController.userWeather[0].main!.toString(),
                              weatherController.userWeather[0].time!.toInt(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Weather Information',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 190,
                child: Card(
                  color: Theme.of(context).colorScheme.onPrimary,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 140,
                              width: 90,
                              child: Card(
                                color: Theme.of(context).colorScheme.primary,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Icon(
                                        Icons.air_sharp,
                                        color: Colors.white,
                                        size: 60,
                                      ),
                                      // Image.asset('assets/43.webp'),
                                      Text(
                                        '${weatherController.userWeather[0].wind!.substring(0, 1)}Km/h',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        //overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              'Wind Speed',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 140,
                              width: 90,
                              child: Card(
                                color: Theme.of(context).colorScheme.primary,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Icon(
                                        Icons.water_drop_outlined,
                                        color: Colors.white,
                                        size: 60,
                                      ),
                                      Text(
                                        '${weatherController.userWeather[0].humidity}%',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              'Humidity',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 140,
                              width: 90,
                              child: Card(
                                color: Theme.of(context).colorScheme.primary,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Icon(
                                        Icons.visibility_outlined,
                                        color: Colors.white,
                                        size: 60,
                                      ),
                                      Text(
                                        '${weatherController.userWeather[0].visibility!.substring(0, 1)}km',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              'Visibility',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Today',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(DaysScreen.routeName);
                      },
                      child: const Text(
                        'Next 7 days  >',
                      ),
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
                      width: 85,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 8.0,
                          left: 8,
                        ),
                        child: Card(
                          elevation: 5,
                          //shadowColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
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
                                  weatherController.userWeather[index].main!
                                      .toString(),
                                  weatherController.userWeather[index].time!
                                      .toInt(),
                                ),
                                Text(
                                  '${weatherController.userWeather[index].temp}'
                                  '${String.fromCharCodes(Runes('\u00b0'))}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
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
    );
  }
}
