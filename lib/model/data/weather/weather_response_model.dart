import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/core/model/base_response_model.dart';
import 'package:weather_app/model/data/location/location_response_model.dart';

part 'weather_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ConditionInfoModel {
  String? text;
  String? icon;
  int? code;
  ConditionInfoModel();

  factory ConditionInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ConditionInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionInfoModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class WeatherInfoModel {
  double? tempC;
  double? tempF;
  ConditionInfoModel? condition;
  double? humidity;
  double? windKph;
  double? feelslikeC;
  double? feelslikeF;

  WeatherInfoModel();

  factory WeatherInfoModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherInfoModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class WeatherResponseModel extends BaseResponseModel {
  LocationResponseModel? location;
  WeatherInfoModel? current;

  WeatherResponseModel();
  @override
  WeatherResponseModel fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WeatherResponseModelToJson(this);

  factory WeatherResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseModelFromJson(json);
}
