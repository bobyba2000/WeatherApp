import 'package:flutter/material.dart';
import 'package:weather_app/bloc/weather/weather_bloc.dart';
import 'package:weather_app/core/bloc/base_state.dart';
import 'package:weather_app/core/widget/base_widget.dart';

class WeatherPage extends BaseView<WeatherBloc> {
  const WeatherPage({super.key});

  @override
  Widget buildView(BuildContext context, BaseState state) {
    return Scaffold();
  }
}
