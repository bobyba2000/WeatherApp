import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/core/model/base_response_model.dart';

part 'location_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LocationResponseModel {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;

  LocationResponseModel();

  LocationResponseModel fromJson(Map<String, dynamic> json) =>
      _$LocationResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationResponseModelToJson(this);

  factory LocationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseModelFromJson(json);

  @override
  String toString() {
    return name ?? '';
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ListSuggestLocationResponseModel extends BaseResponseModel {
  List<LocationResponseModel>? data;
  ListSuggestLocationResponseModel();

  @override
  Map<String, dynamic> toJson() =>
      _$ListSuggestLocationResponseModelToJson(this);

  @override
  BaseResponseModel fromJson(Map<String, dynamic> json) =>
      _$ListSuggestLocationResponseModelFromJson(json);
}
