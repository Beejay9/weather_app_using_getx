import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controllers/weather_controller.dart';
import 'package:weather_app/widgets/image_widget.dart';
import 'package:weather_app/widgets/text_widget.dart';

class DaysScreen extends StatelessWidget {
  DaysScreen({super.key});
  static const routeName = '/daysScreen';
  WeatherController weatherController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Theme.of(context).colorScheme.primary,
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(
                      15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                              iconSize: 30,
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.calendar_today,
                                  color: Colors.white,
                                  // size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '7 Days',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 55,
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: ImageWidget('1001', 14),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'Tomorrow',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    weatherController
                                                .daysWeather[1].temp!.length >
                                            1
                                        ? '${weatherController.daysWeather[1].temp!.substring(0, 2)}'
                                            '${String.fromCharCodes(Runes('\u00b0'))}'
                                        : '${weatherController.daysWeather[1].temp}'
                                            '${String.fromCharCodes(Runes('\u00b0'))}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 80,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Text(
                                    TextWidget(
                                      weatherController.daysWeather[1].main!,
                                    ),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Icon(
                                    Icons.air_outlined,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                ),
                                Text(
                                  '${weatherController.daysWeather[1].wind}km/h',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                const Text(
                                  'Wind',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 189, 188, 188),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Icon(
                                    Icons.water_drop_outlined,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                ),
                                Text(
                                  '${weatherController.daysWeather[1].humidity}%',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                const Text(
                                  'Humidity',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 189, 188, 188),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Icon(
                                    Icons.visibility_outlined,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                ),
                                Text(
                                  '${weatherController.daysWeather[1].visibility}km',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                const Text(
                                  'Visibility',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 189, 188, 188),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Theme.of(context).colorScheme.onPrimary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${weatherController.daysWeather[index].day}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: ImageWidget(
                                  weatherController.daysWeather[index].main!
                                      .toString(),
                                  11,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                TextWidget(
                                  weatherController.daysWeather[index].main!
                                      .toString(),
                                ),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '${weatherController.daysWeather[index].temp}'
                            '${String.fromCharCodes(Runes('\u00b0'))}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  itemCount: 7,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
