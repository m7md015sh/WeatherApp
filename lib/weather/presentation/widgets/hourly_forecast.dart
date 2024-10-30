import 'package:flutter/material.dart';
import 'package:weather_app/weather/presentation/widgets/hourly_weather_item.dart';

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          HourlyWeatherItem(time: "05:00 AM", temp: "23°C",icon: Icons.wb_sunny),
          HourlyWeatherItem(time:"06:00 AM", temp: "20°C", icon: Icons.cloud),
          HourlyWeatherItem(time:"07:00 AM",temp: "17°C", icon:Icons.cloud_queue),
          HourlyWeatherItem(time:"08:00 AM",temp:"16°C",icon: Icons.beach_access),
        ],
      ),
    );
  }
}
