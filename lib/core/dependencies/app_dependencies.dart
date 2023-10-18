import 'package:get_it/get_it.dart';
import 'package:weather_app/bloc/bloc_dependencies.dart';
import 'package:weather_app/core/service/rest_utils.dart';
import 'package:weather_app/model/data/dependencies.dart';
import 'package:weather_app/service/service_dependencies.dart';

class AppDependencies {
  static GetIt injector = GetIt.instance;

  AppDependencies._();

  static void init() {
    injector.registerFactory(
      () => RestUtils(
        'http://api.weatherapi.com/v1/',
      ),
    );
    DataModelDependencies.init();
    ServiceDependencies.init();
    BlocDependencies.init();
  }
}
