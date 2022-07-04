import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fake_weather/core/exception/network_exception.dart';
import 'package:fake_weather/features/weather/data/models/weather_model.dart';
import 'package:fake_weather/features/weather/domain/repositories/weather_repository.dart';
import 'package:flutter/material.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _repository;

  WeatherCubit(this._repository) : super(const WeatherInitial());

  Future<void> getWeather(String city) async {
    try {
      emit(const WeatherLoading());
      final weather = await _repository.fetchWeather(city);
      emit(WeatherLoaded(weather));
    } on NetworkException {
      emit(const WeatherError('Erro na requisição'));
    }
  }
}
