class Weather {
  //String? id;
  String? main;
  //String? description;
  String? temp;
  String? humidity;
  String? wind;
  String? visibility;
  String? city;
  String? country;
  int? time;
  String? timeZone;
  String? day;

  Weather({
    //required this.id,
    required this.main,
    //required this.description,
    required this.temp,
    // required this.pressure,
    required this.humidity,
    required this.wind,
    required this.visibility,
    required this.city,
    required this.time,
    required this.country,
    required this.timeZone,
    this.day,
  });
}
