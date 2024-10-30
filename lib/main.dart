import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weather/presentation/controller/weather_cubit/weather_cubit.dart';
import 'package:weather_app/weather/presentation/screens/main_detailes_screen.dart';

void main() async{
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context)=>WeatherCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainDetailsScreen(),
      ),
    );
  }
}



