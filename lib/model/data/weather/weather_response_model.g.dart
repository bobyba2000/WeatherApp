// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConditionInfoModel _$ConditionInfoModelFromJson(Map<String, dynamic> json) =>
    ConditionInfoModel(
      json['text'] as String,
      json['icon'] as String,
      json['code'] as int,
    );

Map<String, dynamic> _$ConditionInfoModelToJson(ConditionInfoModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
      'code': instance.code,
    };

WeatherInfoModel _$WeatherInfoModelFromJson(Map<String, dynamic> json) =>
    WeatherInfoModel(
      (json['temp_c'] as num).toDouble(),
      (json['temp_f'] as num).toDouble(),
      ConditionInfoModel.fromJson(json['condition'] as Map<String, dynamic>),
      (json['humidity'] as num).toDouble(),
      (json['wind_kph'] as num).toDouble(),
      (json['feelslike_c'] as num).toDouble(),
      (json['feelslike_f'] as num).toDouble(),
    );

Map<String, dynamic> _$WeatherInfoModelToJson(WeatherInfoModel instance) =>
    <String, dynamic>{
      'temp_c': instance.tempC,
      'temp_f': instance.tempF,
      'condition': instance.condition,
      'humidity': instance.humidity,
      'wind_kph': instance.windKph,
      'feelslike_c': instance.feelslikeC,
      'feelslike_f': instance.feelslikeF,
    };

WeatherResponseModel _$WeatherResponseModelFromJson(
        Map<String, dynamic> json) =>
    WeatherResponseModel(
      LocationResponseModel.fromJson(json['location'] as Map<String, dynamic>),
      WeatherInfoModel.fromJson(json['current'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherResponseModelToJson(
        WeatherResponseModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
    };
