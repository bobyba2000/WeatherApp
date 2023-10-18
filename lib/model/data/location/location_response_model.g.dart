// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationResponseModel _$LocationResponseModelFromJson(
        Map<String, dynamic> json) =>
    LocationResponseModel()
      ..name = json['name'] as String?
      ..region = json['region'] as String?
      ..country = json['country'] as String?
      ..lat = (json['lat'] as num?)?.toDouble()
      ..lon = (json['lon'] as num?)?.toDouble()
      ..tzId = json['tz_id'] as String?
      ..localtimeEpoch = json['localtime_epoch'] as int?
      ..localtime = json['localtime'] == null
          ? null
          : DateTime.parse(json['localtime'] as String);

Map<String, dynamic> _$LocationResponseModelToJson(
        LocationResponseModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
      'lat': instance.lat,
      'lon': instance.lon,
      'tz_id': instance.tzId,
      'localtime_epoch': instance.localtimeEpoch,
      'localtime': instance.localtime?.toIso8601String(),
    };
