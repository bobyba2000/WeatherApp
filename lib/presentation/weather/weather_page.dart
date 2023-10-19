import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:weather_app/bloc/weather/weather_bloc.dart';
import 'package:weather_app/bloc/weather/weather_event.dart';
import 'package:weather_app/bloc/weather/weather_state.dart';
import 'package:weather_app/common/extension/num_extension.dart';
import 'package:weather_app/common/utility/toast_utility.dart';
import 'package:weather_app/common/widget/time_widget.dart';
import 'package:weather_app/core/bloc/base_state.dart';
import 'package:weather_app/core/widget/base_widget.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/presentation/weather/widget/search_location_widget.dart';

import '../../common/widget/image_network_widget.dart';

part './widget/temperature_widget.dart';

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
    final temperatureType =
        (state is WeatherState) ? state.type : TemperatureType.F;
    final bloc = context.read<WeatherBloc>();
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (weather != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text(
                              '${weather.location?.name} - ${weather.location?.country}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        const TimeWidget(),
                      ],
                    ),
                  ),
                  6.wSpace,
                  FlutterSwitch(
                    value: temperatureType == TemperatureType.F,
                    onToggle: (bool value) {
                      bloc.add(
                        ChangeTemperatureType(
                          type: value ? TemperatureType.F : TemperatureType.C,
                        ),
                      );
                    },
                    width: 50,
                    height: 30,
                    activeColor: Theme.of(context).colorScheme.onSurface,
                    inactiveColor: Theme.of(context).colorScheme.onSurface,
                    activeIcon: Text(
                      '°F',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                    inactiveIcon: Text(
                      '°C',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                  )
                ],
              ),
              16.hSpace,
              Visibility(
                visible: weather != null,
                child: Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 40),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16)
                            .copyWith(top: 24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  _TemperatureWidget(
                                    tempF: weather?.current?.tempF ?? 0,
                                    tempC: weather?.current?.tempC ?? 0,
                                    type: temperatureType,
                                  ),
                                  const Spacer(),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        weather?.current?.condition?.text ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSecondary,
                                            ),
                                      ),
                                      2.hSpace,
                                      Text(
                                        '${S.current.realFeel}: ${temperatureType == TemperatureType.C ? '${weather?.current?.feelslikeC}°C' : '${weather?.current?.feelslikeF}°F'}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSecondary),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: weather?.current?.condition?.icon != null,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: const EdgeInsets.all(2),
                            child: ImageNetworkWidget(
                              url: 'https:${weather?.current?.condition?.icon}',
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () => bloc.add(ReloadEvent()),
                          child: Container(
                            margin: const EdgeInsets.only(
                              top: 46,
                              right: 6,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Theme.of(context).colorScheme.surface,
                            ),
                            padding: const EdgeInsets.all(4),
                            child: Iconify(
                              Mdi.reload,
                              color: Theme.of(context).colorScheme.onSurface,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              16.hSpace,
              SearchLocationWidget(
                onSubmit: (value) {
                  bloc.add(GetCurrentWeatherEvent(query: value));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
