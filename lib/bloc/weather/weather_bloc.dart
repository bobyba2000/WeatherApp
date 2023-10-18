import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/bloc/base_bloc.dart';
import 'package:weather_app/core/bloc/base_event.dart';
import 'package:weather_app/core/bloc/base_state.dart';
import 'package:weather_app/core/dependencies/app_dependencies.dart';
import 'package:weather_app/service/weather_service.dart';

class WeatherBloc extends BaseBloc {
  WeatherBloc() : super(const InitialState());

  final weatherService = AppDependencies.injector.get<WeatherService>();

  @override
  Future<void> handleEvent(BaseEvent event, Emitter<BaseState> emit) async {}
}
