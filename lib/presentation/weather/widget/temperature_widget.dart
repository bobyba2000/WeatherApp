part of '../weather_page.dart';

class _TemperatureWidget extends StatelessWidget {
  final num tempF;
  final num tempC;
  final TemperatureType type;
  const _TemperatureWidget({
    required this.tempF,
    required this.tempC,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          type == TemperatureType.C ? tempC.toString() : tempF.toString(),
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
        ),
        4.wSpace,
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Iconify(
              Ic.outline_circle,
              color: Theme.of(context).colorScheme.onSecondary,
              size: 16,
            ),
            4.hSpace,
            Text(
              type == TemperatureType.C ? 'C' : 'F',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
            ),
          ],
        )
      ],
    );
  }
}
