class WeatherModel {
  final String cityName;
  final DateTime updatedDate;
  final double maxTemp;
  final double minTemp;
  final double avgTemp;
  final String condition;
  final String image;

  WeatherModel( 
      {required this.avgTemp,
      required this.image,
      required this.cityName,
      required this.condition,
      required this.updatedDate,
      required this.maxTemp,
      required this.minTemp});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        image: json['forecast']["forecastday"][0]['day']["condition"]['icon'],
        avgTemp: json['forecast']["forecastday"][0]['day']["avgtemp_c"],
        cityName: json['location']['name'],
        condition: json['forecast']["forecastday"][0]['day']["condition"]['text'],
        updatedDate: DateTime.parse(json['current']['last_updated']),
        maxTemp: json['forecast']["forecastday"][0]['day']["maxtemp_c"],
        //we use [0] because it's a list not map so here need to use index and we have only one map in list 
        // that's why we use index 0 ,
        // if it was a map then we'll use key not index
        // so it's very important to be sure what's come from API
        minTemp: json['forecast']["forecastday"][0]['day']["mintemp_c"]);
  }
}
