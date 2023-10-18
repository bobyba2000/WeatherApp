// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherRequest _$CurrentWeatherRequestFromJson(
        Map<String, dynamic> json) =>
    CurrentWeatherRequest(
      json['q'] as String,
      json['key'] as String,
    );

Map<String, dynamic> _$CurrentWeatherRequestToJson(
        CurrentWeatherRequest instance) =>
    <String, dynamic>{
      'key': instance.apiKey,
      'q': instance.q,
    };
