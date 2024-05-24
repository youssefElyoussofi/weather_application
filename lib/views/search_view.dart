import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/modules/weather_module.dart';
import 'package:weather_app/services/weather_service.dart';


class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Search City'),),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          
          child: TextField(
            // onChanged: (value) {
            //   log(value);
            // },
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityNamee: value);
              Navigator.pop(context);
            },
            maxLength: 30,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
              labelText: 'Search',
              suffixIcon: const Icon(Icons.search),
              hintText: 'Entre City Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15)
              )
            ),
          ),
        ),
      ),  
    );
  }
}

