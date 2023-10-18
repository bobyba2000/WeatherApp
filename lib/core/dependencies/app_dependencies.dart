import 'package:get_it/get_it.dart';
import 'package:weather_app/constants/app_keys.dart';
import 'package:weather_app/core/service/rest_utils.dart';

class AppDependencies {
  static GetIt injector = GetIt.instance;

  AppDependencies._();

  static void init() {
    injector.registerFactory(
      () => RestUtils(
        'http://api.weatherapi.com/v1',
        apiKey: String.fromEnvironment(AppKeys.apiKey),
      ),
    );
  }
}
