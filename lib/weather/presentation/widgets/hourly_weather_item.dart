import 'package:flutter/material.dart';

class HourlyWeatherItem extends StatelessWidget {
   HourlyWeatherItem({Key? key, this.time, this.temp, this.icon}) : super(key: key);
  final time; final temp; final icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(height: 8),
          Text(
            time,
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            temp,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
