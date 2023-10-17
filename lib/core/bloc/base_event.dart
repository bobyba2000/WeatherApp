import 'package:equatable/equatable.dart';

abstract class BaseEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialEvent extends BaseEvent {}
