// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationResponseModel _$LocationResponseModelFromJson(
        Map<String, dynamic> json) =>
    LocationResponseModel(
      json['name'] as String,
      json['region'] as String,
      json['country'] as String,
      (json['lat'] as num).toDouble(),
      (json['lon'] as num).toDouble(),
      json['tz_id'] as String,
      json['localtime_epoch'] as int,
      DateTime.parse(json['localtime'] as String),
    );

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
      'localtime': instance.localtime.toIso8601String(),
    };
