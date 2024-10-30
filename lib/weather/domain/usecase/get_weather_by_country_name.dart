import 'package:weather_app/weather/domain/domain_repository/base_weather_repository.dart';
import 'package:weather_app/weather/domain/entities/weather.dart';

class GetWeatherByCountryName{
    final BaseWeatherRepository repo;
    GetWeatherByCountryName(this.repo);

    Future<Weather> execute(String cityName)async{
     return await repo.getWeatherByCityName(cityName);
    }
}