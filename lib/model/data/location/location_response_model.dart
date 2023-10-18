import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/core/model/base_response_model.dart';

part 'location_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LocationResponseModel extends BaseResponseModel {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  DateTime? localtime;

  LocationResponseModel();

  @override
  LocationResponseModel fromJson(Map<String, dynamic> json) =>
      _$LocationResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LocationResponseModelToJson(this);

  factory LocationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseModelFromJson(json);
}
