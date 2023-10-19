import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather/weather_event.dart';
import 'package:weather_app/bloc/weather/weather_state.dart';
import 'package:weather_app/common/utility/loading_utility.dart';
import 'package:weather_app/common/utility/location_utility.dart';
import 'package:weather_app/constants/app_keys.dart';
import 'package:weather_app/core/bloc/base_bloc.dart';
import 'package:weather_app/core/bloc/base_event.dart';
import 'package:weather_app/core/bloc/base_state.dart';
import 'package:weather_app/core/dependencies/app_dependencies.dart';
import 'package:weather_app/core/service/result.dart';
import 'package:weather_app/model/data/weather/current_weather_request_model.dart';
import 'package:weather_app/service/weather_service.dart';

class WeatherBloc extends BaseBloc {
  WeatherBloc() : super(const InitialState());

  final weatherService = AppDependencies.injector.get<WeatherService>();
  String query = '';

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
      query = event.query;
      return getCurrentWeather(emit);
    }
    if (event is ReloadEvent) {
      return getCurrentWeather(emit);
    }

    if (event is ChangeTemperatureType) {
      emit(weatherState.copyWith(type: event.type));
    }
  }

  @override
  Future<void> onInit(Emitter<BaseState> emit) {
    add(GetCurrentLocationEvent());
    return super.onInit(emit);
  }

  WeatherState get weatherState {
    if (state is WeatherState) {
      return state as WeatherState;
    }
    return const WeatherState(
      model: null,
      type: TemperatureType.F,
    );
  }

  Future<void> getCurrentWeather(Emitter<BaseState> emit) async {
    LoadingUtility.show();

    emit(weatherState.copyWith());
    final response = await weatherService.getCurrentWeather(
      CurrentWeatherRequest(
        query,
        const String.fromEnvironment(AppKeys.apiKey),
      ),
    );
    if (response.isSuccessful) {
      emit(weatherState.copyWith(model: response.data));
    } else {
      emit(
        weatherState.copyToErrorState((response as Failed).message),
      );
    }

    LoadingUtility.dismiss();
  }
}
