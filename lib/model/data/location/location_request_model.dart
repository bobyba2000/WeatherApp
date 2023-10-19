import 'package:weather_app/model/data/weather/weather_request_model.dart';

class GetSuggestLocationRequestModel extends WeatherRequestModel {
  final String query;
  GetSuggestLocationRequestModel(super.apiKey, this.query);

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}
