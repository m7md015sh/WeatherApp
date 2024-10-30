

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weather/data/data_repository/data_weather_repository.dart';
import 'package:weather_app/weather/data/data_source/remote_data_source.dart';
import 'package:weather_app/weather/data/models/weather_model.dart';
import 'package:weather_app/weather/domain/domain_repository/base_weather_repository.dart';
import 'package:weather_app/weather/domain/usecase/get_weather_by_country_name.dart';

import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState>{
  bool isLoaded=false;
  WeatherCubit() : super(WeatherInitialState());



  WeatherModel? weatherModel;

  void getWeather({required String cityName}) async{
    emit(WeatherLoadingState());
    isLoaded=false;
    try {

      BaseRemoteDataSource baseRemoteDataSource=RemoteDataSource();

      BaseWeatherRepository baseWeatherRepository=WeatherRepository(baseRemoteDataSource);

      weatherModel=(await GetWeatherByCountryName(baseWeatherRepository).execute('$cityName')) as WeatherModel?;
      isLoaded=true;
      emit(WeatherSuccessState());
    }on Exception catch(e){
      emit(WeatherFailureState());
    }
  }
}