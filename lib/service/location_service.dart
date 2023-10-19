import 'package:weather_app/constants/service_path.dart';
import 'package:weather_app/core/service/base_service.dart';
import 'package:weather_app/core/service/rest_utils.dart';
import 'package:weather_app/core/service/result.dart';
import 'package:weather_app/model/data/location/location_request_model.dart';
import 'package:weather_app/model/data/location/location_response_model.dart';

class LocationService extends BaseService {
  Future<Result<ListSuggestLocationResponseModel>> getSuggestLocation(
      GetSuggestLocationRequestModel request) {
    return rest.sendRequest(
      Method.get,
      '${ServicePath.suggestLocation}?q=${request.query}&key=${request.apiKey}',
    );
  }
}
