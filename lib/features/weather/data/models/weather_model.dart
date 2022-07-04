import 'package:fake_weather/features/weather/domain/entities/weather_entities.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({
    required super.cityName,
    required super.temperature,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is WeatherModel &&
        o.cityName == cityName &&
        o.temperature == temperature;
  }

  @override
  int get hashCode => cityName.hashCode ^ temperature.hashCode;
}
