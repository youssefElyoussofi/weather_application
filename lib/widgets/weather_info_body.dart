
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/modules/weather_module.dart';


class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody(
     {Key? key, }) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
       decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                      
                        getThemeColor(weatherModel.condition),
                        getThemeColor(weatherModel.condition)[50]!,
                      ],
                
                    ),
                  ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
             Text(
              'updated at ${weatherModel.updatedDate.hour}:${weatherModel.updatedDate.minute}',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network('https:${weatherModel.image}'),
                   Text(
                    '${weatherModel.avgTemp.round()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                   Column(
                    children: [
                      Text(
                        'Max : ${weatherModel.maxTemp.round()}',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Min : ${weatherModel.minTemp.round()}',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherModel.condition,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



