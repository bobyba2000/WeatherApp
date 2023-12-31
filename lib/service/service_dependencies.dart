import 'package:weather_app/core/dependencies/app_dependencies.dart';
import 'package:weather_app/service/location_service.dart';
import 'package:weather_app/service/weather_service.dart';

class ServiceDependencies {
  static void init() {
    AppDependencies.injector.registerLazySingleton(() => WeatherService());
    AppDependencies.injector.registerLazySingleton(() => LocationService());
  }
}
