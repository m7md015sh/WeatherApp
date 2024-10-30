import 'package:weather_app/weather/data/data_source/remote_data_source.dart';
import 'package:weather_app/weather/domain/domain_repository/base_weather_repository.dart';
import 'package:weather_app/weather/domain/entities/weather.dart';

class WeatherRepository implements BaseWeatherRepository{
  final BaseRemoteDataSource baseRemoteDataSource;
  WeatherRepository(this.baseRemoteDataSource);

  @override
  Future<Weather> getWeatherByCityName(String cityName) async{
   return (await baseRemoteDataSource.getWeatherByCityName(cityName))!;
  }

}