import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fake_weather/model/weather.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    // ignore: void_checks
    on<WeatherEvent>((event, emit) async* {
      if (event is GetWeather) {
        yield WeatherLoading();
        final weather = await __fetchWeatherFromFakeApi(event.cityName);
        yield WeatherLoaded(weather);
      }
    });
  }

  Future<Weather> __fetchWeatherFromFakeApi(String cityName) {
    return Future.delayed(const Duration(seconds: 1), () {
      return Weather(
          cityName: cityName,
          temperature: 20 + Random().nextInt(20) + Random().nextDouble());
    });
  }
}
