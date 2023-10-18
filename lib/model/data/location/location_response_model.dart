import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/core/model/base_response_model.dart';

part 'location_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LocationResponseModel extends BaseResponseModel {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String tzId;
  final int localtimeEpoch;
  final DateTime localtime;

  LocationResponseModel(
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  );

  @override
  LocationResponseModel fromJson(Map<String, dynamic> json) =>
      _$LocationResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LocationResponseModelToJson(this);

  factory LocationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseModelFromJson(json);
}
