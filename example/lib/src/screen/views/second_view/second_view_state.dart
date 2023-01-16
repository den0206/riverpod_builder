import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../_generated/src/screen/views/second_view/second_view_state.freezed.dart';
part '../../../_generated/src/screen/views/second_view/second_view_state.g.dart';

@freezed
class SecondViewState with _$SecondViewState {
  const factory SecondViewState({
    @Default([]) List<String> list,
  }) = _SecondViewState;
  factory SecondViewState.fromJson(Map<String, dynamic> json) =>
      _$SecondViewStateFromJson(json);
}
