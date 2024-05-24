

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/modules/weather_module.dart';

class WeatherService {
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '14ce05e21276415984685746240602';

  final Dio dio = Dio();

  WeatherService();
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
  Response response =
      await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
  WeatherModel weatherModel = WeatherModel.fromJson(response.data);
  return weatherModel;
} on  DioException catch (e) {
  // TODO
  final String errorMessage = e.response?.data['error']['message']??"Opps there's error , try later";
  throw Exception(errorMessage);

}
//this is optional step to get more safty 
catch(e){
  // log(e.toString());
  throw Exception("Opps there's error , try later");
}
  }
}



// class WeatherServicePlus{
//   final Dio dio;

//   WeatherServicePlus(this.dio);

//   Future<WeatherModel> getTodayWeather({required String cityNName}) async{
//     Response response = await dio.get('https://api.weatherapi.com/v1/forecast.json?key=14ce05e21276415984685746240602&q=$cityNName&days=1');
//     WeatherModel weatherModelplus = WeatherModel.fromJson(response.data);
//     return weatherModelplus;
//   }

// }
