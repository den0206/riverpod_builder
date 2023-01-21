import 'package:example/src/common/providers/providers.dart';
import 'package:example/src/screen/views/first_view/first_view_state.dart';
import 'package:example/src/screen/views/second_view/second_view_model.dart';
import 'package:riverpod_builder/view_model/src/base_view_model.dart';

class FirstViewModel extends BaseViewModel<FirstViewState> {
  @override
  get instanse => const FirstViewState();

  int get count => state.count;

  // listen other provider
  int? get streamCount =>
      widgetRef.watch(UtilsProviders.streamCountProvider).value;

  // listen other provider
  SecondViewModel get secondVM =>
      widgetRef.watch(ViewProviders.secondViewModelProvider.notifier);

  void addCount() {
    state = state.copyWith(count: state.count + 1);
  }

  void refreshStreamCount() {
    refreshProvider(UtilsProviders.streamCountProvider);
  }

  void refreshSecoundViewModel() {
    refreshProvider(ViewProviders.secondViewModelProvider);
  }
}
