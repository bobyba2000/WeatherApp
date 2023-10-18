import 'package:weather_app/core/bloc/base_state.dart';
import 'package:weather_app/model/data/weather/weather_response_model.dart';

class WeatherState extends BaseState {
  final WeatherResponseModel? model;

  const WeatherState({required this.model});
  @override
  List<Object?> get props => [model];

  WeatherErrorState copyToErrorState(String message) {
    return WeatherErrorState(model: model, message: message);
  }
}

class WeatherErrorState extends WeatherState {
  final String message;
  const WeatherErrorState({required super.model, required this.message});

  @override
  List<Object?> get props => super.props..add(message);
}
