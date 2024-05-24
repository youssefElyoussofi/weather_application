

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/modules/weather_module.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState>{
  GetWeatherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;
  getWeather({required String cityNamee})async{
    try {
  weatherModel = await WeatherService().getCurrentWeather(cityName: cityNamee);
          emit(WeatherLoadedState(weatherModel!));
} catch (e) {
  // TODO
  emit(WeatherFailureState(
    e.toString()
  ));
}
  }

}