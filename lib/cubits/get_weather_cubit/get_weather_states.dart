
import 'package:weather_app/modules/weather_module.dart';

class WeatherState{}

class WeatherInitialState extends WeatherState{}
class WeatherLoadedState extends WeatherState{
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}
class WeatherFailureState extends WeatherState{
  final String errMessage;

  WeatherFailureState(this.errMessage);
}