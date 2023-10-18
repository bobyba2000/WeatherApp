import 'package:weather_app/constants/service_path.dart';
import 'package:weather_app/core/service/base_service.dart';
import 'package:weather_app/core/service/rest_utils.dart';
import 'package:weather_app/model/data/weather/current_weather_request_model.dart';
import 'package:weather_app/model/data/weather/weather_response_model.dart';

import '../core/service/result.dart';

class WeatherService extends BaseService {
  Future<Result<WeatherResponseModel>> getCurrentWeather(
    CurrentWeatherRequest request,
  ) {
    return rest.sendRequest(
      Method.get,
      '${ServicePath.currentWeather}?key=${request.apiKey}&q=${request.q}',
      queryParameters: request.toJson(),
    );
  }
}
