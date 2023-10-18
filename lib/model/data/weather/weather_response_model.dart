import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/core/model/base_response_model.dart';
import 'package:weather_app/model/data/location/location_response_model.dart';

part 'weather_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ConditionInfoModel {
  final String text;
  final String icon;
  final int code;
  ConditionInfoModel(
    this.text,
    this.icon,
    this.code,
  );

  factory ConditionInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ConditionInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionInfoModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class WeatherInfoModel {
  final double tempC;
  final double tempF;
  final ConditionInfoModel condition;
  final double humidity;
  final double windKph;
  final double feelslikeC;
  final double feelslikeF;

  WeatherInfoModel(
    this.tempC,
    this.tempF,
    this.condition,
    this.humidity,
    this.windKph,
    this.feelslikeC,
    this.feelslikeF,
  );

  factory WeatherInfoModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherInfoModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class WeatherResponseModel extends BaseResponseModel {
  final LocationResponseModel location;
  final WeatherInfoModel current;

  WeatherResponseModel(this.location, this.current);
  @override
  WeatherResponseModel fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WeatherResponseModelToJson(this);

  factory WeatherResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseModelFromJson(json);
}
