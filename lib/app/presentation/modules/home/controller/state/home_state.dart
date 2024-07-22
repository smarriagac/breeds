import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/breeds/breeds.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loading() = HomeStateLoading;
  const factory HomeState.failed() = HomeStateFailed;
  const factory HomeState.loaded(HomePageState state) = HomeStateLoaded;
}

@freezed
class HomePageState with _$HomePageState {
  factory HomePageState({
    @Default(0) int page,
    required List<Breeds> listBreeds,
  }) = _HomePageState;
}
