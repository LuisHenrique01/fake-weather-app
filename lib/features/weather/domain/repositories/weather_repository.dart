import 'package:fake_weather/features/weather/data/models/weather_model.dart';

abstract class WeatherRepository {
  /// Throws [NetworkException].
  Future<WeatherModel> fetchWeather(String cityName);
}
