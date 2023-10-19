import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/search_location/search_location_bloc.dart';
import 'package:weather_app/common/widget/auto_complete_widget.dart';
import 'package:weather_app/core/bloc/base_state.dart';
import 'package:weather_app/core/widget/base_widget.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/model/data/location/location_response_model.dart';

class SearchLocationWidget extends BaseView<SearchLocationBloc> {
  final Function(String) onSubmit;
  const SearchLocationWidget({
    super.key,
    required this.onSubmit,
  });

  @override
  Widget buildView(BuildContext context, BaseState state) {
    final bloc = context.read<SearchLocationBloc>();
    return AutoCompleteWidget<LocationResponseModel>(
      getSuggestData: (value) async {
        final data = await bloc.getSuggestLocation(value);
        return data?.data ?? [];
      },
      label: S.current.searchLabel,
      suggestionBuilder: (item) => ListTile(
        title: Text(item.name ?? ''),
        subtitle: Text(item.country ?? ''),
      ),
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
      onSubmitted: onSubmit,
      onTapItem: (value) => onSubmit('${value.lat},${value.lon}'),
      hintText: S.current.searchHint,
      hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
    );
  }
}
