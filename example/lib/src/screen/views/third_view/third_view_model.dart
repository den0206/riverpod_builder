import 'package:example/src/screen/views/third_view/third_view_state.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_builder/view_model/src/base_view_model.dart';

class ThirdViewModel extends BaseViewModel<ThirdViewState> {
  @override
  ThirdViewState get instanse => const ThirdViewState();

  final TextEditingController txtController = TextEditingController();

  String get textValue => state.textValue;

  void updateValue() {
    state = state.copyWith(textValue: txtController.text);
    txtController.clear();
  }

  Future<void> popPage() async {
    // avoid flex error
    //https://stackoverflow.com/questions/57146086/executing-navigator-pop-when-key-pad-is-visible-results-in-render-flex-error

    dismissKeyboard();
    await Future.delayed(const Duration(seconds: 1));
  }

  void dismissKeyboard() {
    FocusScope.of(context).unfocus();
  }
}
