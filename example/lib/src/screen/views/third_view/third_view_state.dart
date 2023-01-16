import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../_generated/src/screen/views/third_view/third_view_state.freezed.dart';
part '../../../_generated/src/screen/views/third_view/third_view_state.g.dart';

@freezed
class ThirdViewState with _$ThirdViewState {
  const factory ThirdViewState({
    @Default('') String textValue,
  }) = _ThirdViewState;
  factory ThirdViewState.fromJson(Map<String, dynamic> json) =>
      _$ThirdViewStateFromJson(json);
}
