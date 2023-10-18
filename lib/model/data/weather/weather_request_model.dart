import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/core/model/base_request_model.dart';

abstract class WeatherRequestModel extends BaseRequestModel {
  @JsonKey(name: 'key')
  final String apiKey;

  WeatherRequestModel(this.apiKey);
}
