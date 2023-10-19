import 'package:weather_app/core/bloc/base_state.dart';
import 'package:weather_app/model/data/weather/weather_response_model.dart';

enum TemperatureType {
  C,
  F;
}

class WeatherState extends BaseState {
  final WeatherResponseModel? model;
  final TemperatureType type;

  const WeatherState({
    required this.model,
    required this.type,
  });
  @override
  List<Object?> get props => [model, type];

  WeatherErrorState copyToErrorState(String message) {
    return WeatherErrorState(
      model: model,
      type: type,
      message: message,
    );
  }

  WeatherState copyWith({WeatherResponseModel? model, TemperatureType? type}) {
    return WeatherState(
      model: model ?? this.model,
      type: type ?? this.type,
    );
  }
}

class WeatherErrorState extends WeatherState {
  final String message;
  const WeatherErrorState(
      {required super.model, required super.type, required this.message});

  @override
  List<Object?> get props => super.props..add(message);
}
