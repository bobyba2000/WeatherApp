import 'package:weather_app/core/dependencies/app_dependencies.dart';
import 'package:weather_app/model/data/location/location_response_model.dart';
import 'package:weather_app/model/data/weather/weather_response_model.dart';

class DataModelDependencies {
  static void init() {
    AppDependencies.injector.registerFactory(() => LocationResponseModel());
    AppDependencies.injector.registerFactory(
      () => ListSuggestLocationResponseModel(),
    );
    AppDependencies.injector.registerFactory(() => WeatherResponseModel());
  }
}
