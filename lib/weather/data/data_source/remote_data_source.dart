import 'package:dio/dio.dart';
import 'package:weather_app/core/utils/app_constance.dart';
import 'package:weather_app/weather/data/models/weather_model.dart';

abstract class BaseRemoteDataSource{
  Future<WeatherModel?> getWeatherByCityName(String cityName);
}

class RemoteDataSource implements BaseRemoteDataSource{
  @override
  Future<WeatherModel?> getWeatherByCityName(String cityName) async{
  try{
    var response=await Dio().get('${AppConstance.baseUrl}$cityName&appid=${AppConstance.apiKey}');
    print(response.data);
    return WeatherModel.fromJson(response.data);
  }catch(e){
    print(e);
    return null;
  }
  }

}