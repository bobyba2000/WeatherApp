// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConditionInfoModel _$ConditionInfoModelFromJson(Map<String, dynamic> json) =>
    ConditionInfoModel()
      ..text = json['text'] as String?
      ..icon = json['icon'] as String?
      ..code = json['code'] as int?;

Map<String, dynamic> _$ConditionInfoModelToJson(ConditionInfoModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
      'code': instance.code,
    };

WeatherInfoModel _$WeatherInfoModelFromJson(Map<String, dynamic> json) =>
    WeatherInfoModel()
      ..tempC = (json['temp_c'] as num?)?.toDouble()
      ..tempF = (json['temp_f'] as num?)?.toDouble()
      ..condition = json['condition'] == null
          ? null
          : ConditionInfoModel.fromJson(
              json['condition'] as Map<String, dynamic>)
      ..humidity = (json['humidity'] as num?)?.toDouble()
      ..windKph = (json['wind_kph'] as num?)?.toDouble()
      ..feelslikeC = (json['feelslike_c'] as num?)?.toDouble()
      ..feelslikeF = (json['feelslike_f'] as num?)?.toDouble();

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
    WeatherResponseModel()
      ..location = json['location'] == null
          ? null
          : LocationResponseModel.fromJson(
              json['location'] as Map<String, dynamic>)
      ..current = json['current'] == null
          ? null
          : WeatherInfoModel.fromJson(json['current'] as Map<String, dynamic>);

Map<String, dynamic> _$WeatherResponseModelToJson(
        WeatherResponseModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
    };
