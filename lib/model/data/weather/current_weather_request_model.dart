import 'package:json_annotation/json_annotation.dart';

import 'weather_request_model.dart';

part 'current_weather_request_model.g.dart';

@JsonSerializable()
class CurrentWeatherRequest extends WeatherRequestModel {
  final String q;

  CurrentWeatherRequest(this.q, super.apiKey);

  @override
  Map<String, dynamic> toJson() => _$CurrentWeatherRequestToJson(this);
}
