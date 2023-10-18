import 'package:flutter/material.dart';
import 'package:weather_app/bloc/weather/weather_bloc.dart';
import 'package:weather_app/bloc/weather/weather_state.dart';
import 'package:weather_app/common/utility/toast_utility.dart';
import 'package:weather_app/common/widget/time_widget.dart';
import 'package:weather_app/core/bloc/base_state.dart';
import 'package:weather_app/core/widget/base_widget.dart';

class WeatherPage extends BaseView<WeatherBloc> {
  const WeatherPage({super.key});

  @override
  void handleState(BuildContext context, BaseState state) {
    if (state is WeatherErrorState) {
      ToastUtility.showError(state.message);
    }
    super.handleState(context, state);
  }

  @override
  Widget buildView(BuildContext context, BaseState state) {
    final weather = (state is WeatherState) ? state.model : null;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (weather != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text(
                            '${weather.location?.name} - ${weather.location?.country}',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Theme.of(context).colorScheme.onPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      const TimeWidget(),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
