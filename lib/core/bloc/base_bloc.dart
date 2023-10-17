import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../dependencies/app_dependencies.dart';
import '../service/base_service.dart';
import 'base_event.dart';
import 'base_state.dart';

abstract class BaseBloc<T extends BaseService> extends Bloc<BaseEvent, BaseState> {
  T service = AppDependencies.injector.get<T>();
  BaseBloc(BaseState initialState) : super(initialState) {
    on<BaseEvent>((event, emit) async {
      if (event is InitialEvent) {
        await onInit(emit);
      }
      await handleEvent(event, emit);
    });
  }

  Future<void> handleEvent(BaseEvent event, Emitter<BaseState> emit);

  Future<void> onInit(Emitter<BaseState> emit) async {}
}
