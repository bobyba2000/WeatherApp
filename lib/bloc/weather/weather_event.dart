import 'package:weather_app/core/bloc/base_event.dart';

class WeatherEvent extends BaseEvent {}

class GetCurrentWeatherEvent extends WeatherEvent {
  final String query;

  GetCurrentWeatherEvent({required this.query});
}

class GetCurrentLocationEvent extends WeatherEvent {}
