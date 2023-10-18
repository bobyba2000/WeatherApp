import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather/weather_event.dart';
import 'package:weather_app/common/utility/location_utility.dart';
import 'package:weather_app/constants/app_keys.dart';
import 'package:weather_app/core/bloc/base_bloc.dart';
import 'package:weather_app/core/bloc/base_event.dart';
import 'package:weather_app/core/bloc/base_state.dart';
import 'package:weather_app/core/dependencies/app_dependencies.dart';
import 'package:weather_app/model/data/weather/current_weather_request_model.dart';
import 'package:weather_app/service/weather_service.dart';

class WeatherBloc extends BaseBloc {
  WeatherBloc() : super(const InitialState());

  final weatherService = AppDependencies.injector.get<WeatherService>();

  @override
  Future<void> handleEvent(BaseEvent event, Emitter<BaseState> emit) async {
    if (event is GetCurrentLocationEvent) {
      final locationData = await LocationUtility.getLocation();
      if (locationData != null) {
        add(
          GetCurrentWeatherEvent(
            query: '${locationData.latitude},${locationData.longitude}',
          ),
        );
      }
    }
    if (event is GetCurrentWeatherEvent) {
      return getCurrentWeather(event, emit);
    }
  }

  @override
  Future<void> onInit(Emitter<BaseState> emit) {
    add(GetCurrentLocationEvent());
    return super.onInit(emit);
  }

  Future<void> getCurrentWeather(
      GetCurrentWeatherEvent event, Emitter<BaseState> emit) async {
    final response = await weatherService.getCurrentWeather(
      CurrentWeatherRequest(
        event.query,
        const String.fromEnvironment(AppKeys.apiKey),
      ),
    );
    if (response.isSuccessful) {}
  }
}
