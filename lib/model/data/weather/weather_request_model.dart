import 'package:weather_app/core/model/base_request_model.dart';

abstract class WeatherRequestModel extends BaseRequestModel {
  final String key;

  WeatherRequestModel(this.key);
}
