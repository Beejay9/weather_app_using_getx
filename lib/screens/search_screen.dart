import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controllers/weather_controller.dart';
import 'package:weather_app/widgets/image_widget.dart';
import 'package:weather_app/widgets/text_widget.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});
  static const routeName = '/searchScreen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //TextEditingController searchController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  WeatherController weatherController = Get.find();

  bool isSearch = false;

  String? cityName;

  @override
  void initState() {
    weatherController.cityWeather();
    // TODO: implement initState
    super.initState();
  }

  void getCity() async {
    formKey.currentState!.save();
    await weatherController.fetchCurrentWeather(cityName.toString());
    setState(() {
      isSearch = true;
    });

    print('input text is $cityName');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search for city',
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: !isSearch
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      textAlign: TextAlign.start,
                      DateFormat.MMMMEEEEd().format(DateTime.now()),
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: const Color.fromARGB(255, 112, 112, 112),
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    child: Form(
                      key: formKey,
                      child: TextFormField(
                        // controller: searchController,
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: const InputDecoration(
                          hintText: 'City name',
                          icon: Icon(Icons.search),
                          border: InputBorder.none,
                        ),
                        onSaved: (newValue) {
                          cityName = newValue;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a city';
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          getCity();
                        },
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      // textAlign: TextAlign.start,
                      DateFormat.MMMMEEEEd().format(DateTime.now()),
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: const Color.fromARGB(255, 112, 112, 112),
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    child: Form(
                      key: formKey,
                      child: TextFormField(
                        // controller: searchController,
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: const InputDecoration(
                          hintText: 'City name',
                          icon: Icon(Icons.search),
                          border: InputBorder.none,
                        ),
                        onSaved: (newValue) {
                          cityName = newValue;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a city';
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          getCity();
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: SizedBox(
                      height: 120,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Text(
                          weatherController.daysWeather[1].temp!.length > 1
                              ? '${weatherController.searchWeather[1].temp!.substring(0, 2)}'
                                  '${String.fromCharCodes(Runes('\u00b0'))}'
                              : '${weatherController.searchWeather[1].temp}'
                                  '${String.fromCharCodes(Runes('\u00b0'))}',
                          style: const TextStyle(
                            // color: Colors.white,
                            // fontSize: 70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 150,
                            width: 150,
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: ImageWidget(
                                weatherController.searchWeather[0].main!,
                                weatherController.searchWeather[0].time!,
                              ),
                            ),
                          ),
                          Text(
                            TextWidget(
                              weatherController.searchWeather[0].main!,
                            ),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Wind',
                            style: TextStyle(
                              color: Colors.grey,
                              //fontSize: 17,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10, top: 2),
                            child: Text(
                              '${weatherController.searchWeather[0].wind!.substring(0, 1)}km/h',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const Text(
                            'Humidity',
                            style: TextStyle(
                              color: Colors.grey,
                              // fontSize: 17,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2, bottom: 10),
                            child: Text(
                              '${weatherController.searchWeather[0].humidity!}%',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const Text(
                            'Visibility',
                            style: TextStyle(
                              color: Colors.grey,
                              // fontSize: 17,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2, bottom: 10),
                            child: Text(
                              '${weatherController.searchWeather[0].visibility!}km',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Today',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          //height: 50,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${weatherController.searchWeather[index].time}:00',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    ImageWidget(
                                      weatherController
                                          .searchWeather[index].main!
                                          .toString(),
                                      weatherController
                                          .searchWeather[index].time!
                                          .toInt(),
                                    ),
                                    Text(
                                      '${weatherController.searchWeather[index].temp}'
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
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text(
                      'Other Cities',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          height: 20,
                          width: 200,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          // margin: EdgeInsets.all(10),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 5,
                            color: Theme.of(context).colorScheme.primary,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    //crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: ImageWidget(
                                          weatherController
                                              .lagosWeather!['main']!,
                                          weatherController
                                              .lagosWeather!['time'],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        children: const [
                                          Text(
                                            'Location',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                255,
                                                189,
                                                188,
                                                188,
                                              ),
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            'Lagos',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          const Text(
                                            'Wind',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                255,
                                                189,
                                                188,
                                                188,
                                              ),
                                              fontSize: 13,
                                            ),
                                          ),
                                          Text(
                                            weatherController
                                                .lagosWeather!['wind'],
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            'Temp',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                255,
                                                189,
                                                188,
                                                188,
                                              ),
                                              fontSize: 13,
                                            ),
                                          ),
                                          Text(
                                            weatherController
                                                .lagosWeather!['temp'],
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            'Humidity',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 189, 188, 188),
                                              fontSize: 13,
                                            ),
                                          ),
                                          Text(
                                            weatherController
                                                .lagosWeather!['humidity'],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
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
                        Container(
                          height: 20,
                          width: 200,
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 5,
                          ),
                          // margin: EdgeInsets.all(10),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 5,
                            color: Theme.of(context).colorScheme.primary,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    //crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: ImageWidget(
                                          weatherController
                                              .newyorkWeather!['main'],
                                          weatherController
                                              .newyorkWeather!['time'],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        children: const [
                                          Text(
                                            'Location',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                255,
                                                189,
                                                188,
                                                188,
                                              ),
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            'New York',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          const Text(
                                            'Wind',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                255,
                                                189,
                                                188,
                                                188,
                                              ),
                                              fontSize: 13,
                                            ),
                                          ),
                                          Text(
                                            weatherController
                                                .newyorkWeather!['wind'],
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            'Temp',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                255,
                                                189,
                                                188,
                                                188,
                                              ),
                                              fontSize: 13,
                                            ),
                                          ),
                                          Text(
                                            weatherController
                                                .newyorkWeather!['temp'],
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            'Humidity',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 189, 188, 188),
                                              fontSize: 13,
                                            ),
                                          ),
                                          Text(
                                            weatherController
                                                .newyorkWeather!['humidity'],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
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
                        Container(
                          height: 20,
                          width: 200,
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 5,
                          ),
                          // margin: EdgeInsets.all(10),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 5,
                            color: Theme.of(context).colorScheme.primary,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    //crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: ImageWidget(
                                          weatherController
                                              .beijingWeather!['main'],
                                          weatherController
                                              .beijingWeather!['time'],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        children: const [
                                          Text(
                                            'Location',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                255,
                                                189,
                                                188,
                                                188,
                                              ),
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            'Beijing',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          const Text(
                                            'Wind',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                255,
                                                189,
                                                188,
                                                188,
                                              ),
                                              fontSize: 13,
                                            ),
                                          ),
                                          Text(
                                            weatherController
                                                .beijingWeather!['wind'],
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            'Temp',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                255,
                                                189,
                                                188,
                                                188,
                                              ),
                                              fontSize: 13,
                                            ),
                                          ),
                                          Text(
                                            weatherController
                                                .beijingWeather!['temp'],
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            'Humidity',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 189, 188, 188),
                                              fontSize: 13,
                                            ),
                                          ),
                                          Text(
                                            weatherController
                                                .beijingWeather!['humidity'],
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
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
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
