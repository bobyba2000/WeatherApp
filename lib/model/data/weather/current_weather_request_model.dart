import 'package:json_annotation/json_annotation.dart';

import 'weather_request_model.dart';

@JsonSerializable()
class CurrentWeatherRequest extends WeatherRequestModel {
  final String q;

  CurrentWeatherRequest(this.q, super.key);

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
