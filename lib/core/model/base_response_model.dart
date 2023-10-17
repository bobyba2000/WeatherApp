import 'dart:convert';

import '../dependencies/app_dependencies.dart';

class ResponseResult<T extends BaseResponseModel> {
  T? data;
  bool isSuccess;
  String? errCode;
  String? errMsg;

  ResponseResult({
    this.data,
    required this.isSuccess,
    this.errCode,
    this.errMsg,
  });

  factory ResponseResult.fromJson(Map<String, dynamic> json) {
    T? responseData = AppDependencies.injector.get<T>();
    try {
      if (json['data'] != null) {
        if (json['data'] is List) {
          final listData = <String, dynamic>{};
          listData['items'] = json['data'];
          responseData = responseData.fromJson(listData) as T;
        } else if (json['data'] is String) {
          responseData = responseData.fromJson(json) as T;
        } else {
          responseData = responseData.fromJson(json['data'] as Map<String, dynamic>) as T;
        }
      } else {
        responseData = null;
      }
    } catch (e) {
      return ResponseResult(
        isSuccess: false,
        errCode: '500',
        errMsg: e.toString(),
        data: null,
      );
    }
    return ResponseResult(
      isSuccess: json['is_success'].toString() == 'true',
      errCode: json['err_code'],
      errMsg: json['err_msg'],
      data: responseData,
    );
  }
}

abstract class BaseResponseModel {
  BaseResponseModel fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();

  BaseResponseModel copyWith() {
    return fromJson(jsonDecode(jsonEncode(toJson())));
  }
}
