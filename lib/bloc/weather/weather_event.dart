import 'package:weather_app/bloc/weather/weather_state.dart';
import 'package:weather_app/core/bloc/base_event.dart';

class WeatherEvent extends BaseEvent {}

class GetCurrentWeatherEvent extends WeatherEvent {
  final String query;

  GetCurrentWeatherEvent({required this.query});
}

class GetCurrentLocationEvent extends WeatherEvent {}

class ReloadEvent extends WeatherEvent {}

class ChangeTemperatureType extends WeatherEvent {
  final TemperatureType type;

  ChangeTemperatureType({required this.type});
}
