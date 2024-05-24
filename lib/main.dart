import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor:  Colors.orange),
                  primarySwatch: getThemeColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.condition),
                  appBarTheme: AppBarTheme(
                    backgroundColor: getThemeColor(
                        BlocProvider.of<GetWeatherCubit>(context)
                            .weatherModel
                            ?.condition),
                  )),
              home:HomeView(),
              
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    case 'sunny':
      return Colors.orange;
    case 'partly cloudy':
      return Colors.amber;
    case 'cloudy':
      return Colors.grey;
    case 'overcast':
      return Colors.blueGrey;
    case 'mist':
      return Colors.blueGrey;
    case 'patchy rain possible':
      return Colors.lightBlue;
    case 'patchy snow possible':
    case 'patchy sleet possible':
    case 'patchy freezing drizzle possible':
      return Colors.lightBlue;
    case 'thundery outbreaks possible':
      return Colors.deepPurple;
    case 'blowing snow':
      return Colors.grey;
    case 'blizzard':
      return Colors.grey;
    case 'fog':
      return Colors.grey;
    case 'freezing fog':
      return Colors.grey;
    case 'patchy light drizzle':
      return Colors.lightBlue;
    case 'light drizzle':
      return Colors.lightBlue;
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
    case 'patchy light rain':
      return Colors.lightBlue;
    case 'light rain':
      return Colors.lightBlue;
    case 'moderate rain at times':
      return Colors.lightBlue;
    case 'moderate rain':
      return Colors.lightBlue;
    case 'heavy rain at times':
      return Colors.lightBlue;
    case 'heavy rain':
      return Colors.lightBlue;
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
    case 'light sleet':
    case 'moderate or heavy sleet':
      return Colors.lightBlue;
    case 'patchy light snow':
      return Colors.grey;
    case 'light snow':
      return Colors.grey;
    case 'patchy moderate snow':
      return Colors.grey;
    case 'moderate snow':
      return Colors.grey;
    case 'patchy heavy snow':
      return Colors.grey;
    case 'heavy snow':
      return Colors.grey;
    case 'ice pellets':
      return Colors.grey;
    case 'light rain shower':
      return Colors.lightBlue;
    case 'moderate or heavy rain shower':
      return Colors.lightBlue;
    case 'torrential rain shower':
      return Colors.lightBlue;
    case 'light sleet showers':
    case 'moderate or heavy sleet showers':
      return Colors.lightBlue;
    case 'light snow showers':
      return Colors.grey;
    case 'moderate or heavy snow showers':
      return Colors.grey;
    case 'light showers of ice pellets':
      return Colors.grey;
    case 'moderate or heavy showers of ice pellets':
      return Colors.grey;
    case 'patchy light rain with thunder':
      return Colors.deepPurple;
    case 'moderate or heavy rain with thunder':
      return Colors.deepPurple;
    case 'patchy light snow with thunder':
      return Colors.deepPurple;
    case 'moderate or heavy snow with thunder':
      return Colors.deepPurple;
    default:
      return Colors.grey;
  }
}
