import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../_generated/src/screen/views/first_view/first_view_state.freezed.dart';
part '../../../_generated/src/screen/views/first_view/first_view_state.g.dart';

@freezed
class FirstViewState with _$FirstViewState {
  const factory FirstViewState({
    @Default(0) int count,
  }) = _FirstViewState;
  factory FirstViewState.fromJson(Map<String, dynamic> json) =>
      _$FirstViewStateFromJson(json);
}
