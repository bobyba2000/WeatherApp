import 'package:weather_app/bloc/weather/weather_bloc.dart';
import 'package:weather_app/core/dependencies/app_dependencies.dart';

class BlocDependencies {
  static void init() {
    AppDependencies.injector.registerFactory(() => WeatherBloc());
  }
}
