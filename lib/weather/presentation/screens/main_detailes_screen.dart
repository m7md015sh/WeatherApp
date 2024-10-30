import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weather/presentation/controller/weather_cubit/weather_cubit.dart';
import 'package:weather_app/weather/presentation/controller/weather_cubit/weather_state.dart';
import 'package:weather_app/weather/presentation/screens/search_screen.dart';
import 'package:weather_app/weather/presentation/widgets/hourly_forecast.dart';
import 'package:weather_app/weather/presentation/widgets/weather_details.dart';

class MainDetailsScreen extends StatelessWidget {
   const MainDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit,WeatherState>(

      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple.shade200,
            actions: [
              IconButton(onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>  SearchPage(),
                  ),
                );
              }, icon: const Icon(Icons.search),color: Colors.white,)
            ],
          ),
          body:  Stack(
            children: [
              // Background image or color
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.deepPurple.shade200,
                      Colors.deepPurple.shade800,

                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Padding(
                padding:  const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // Header with temperature
                    Padding(
                      padding: const EdgeInsets.all(16.0),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          const SizedBox(height: 50), // Space for the status bar
                           Text(
                            "${context.read<WeatherCubit>().weatherModel?.cityName}",

                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${context.read<WeatherCubit>().weatherModel?.degree}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 80,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "${context.read<WeatherCubit>().weatherModel?.main}",
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Weather details
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white.withOpacity(0.2),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: WeatherDetails(title: "23:00", subtitle: "Slight chance of rain")),
                            Expanded(child: WeatherDetails(title: "14 km/h", subtitle:"Gentle breeze now")),
                            Expanded(child: WeatherDetails(title: "UV 2", subtitle:"Low sunburn risk")),
                          ],
                        ),
                      ),
                    ),
                    // Hourly forecast
                    const Padding(
                      padding: EdgeInsets.only(top: 24.0),
                      child: HourlyForecast(),
                    ),
                    // Tomorrow forecast
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tomorrow",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("Light Rain Showers"),
                            Text("17°C / 10°C"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        );
      },

    );
  }
}


