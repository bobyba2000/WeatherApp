import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/bloc/base_bloc.dart';
import 'package:weather_app/core/bloc/base_event.dart';
import 'package:weather_app/core/bloc/base_state.dart';
import 'package:weather_app/core/dependencies/app_dependencies.dart';
import 'package:weather_app/model/data/location/location_request_model.dart';
import 'package:weather_app/model/data/location/location_response_model.dart';
import 'package:weather_app/service/location_service.dart';

import '../../constants/app_keys.dart';

class SearchLocationBloc extends BaseBloc {
  final service = AppDependencies.injector.get<LocationService>();

  SearchLocationBloc() : super(const InitialState());

  @override
  Future<void> handleEvent(BaseEvent event, Emitter<BaseState> emit) async {}

  Future<ListSuggestLocationResponseModel?> getSuggestLocation(
      String value) async {
    final response = await service.getSuggestLocation(
      GetSuggestLocationRequestModel(
          const String.fromEnvironment(AppKeys.apiKey), value),
    );
    return response.data;
  }
}
