import 'package:example/src/repositry/sample_repositry.dart';
import 'package:example/src/screen/main_tab/main_tab_notifier.dart';
import 'package:example/src/screen/router.dart';
import 'package:example/src/screen/views/first_view/first_view_model.dart';
import 'package:example/src/screen/views/first_view/first_view_state.dart';
import 'package:example/src/screen/views/second_view/second_view_model.dart';
import 'package:example/src/screen/views/second_view/second_view_state.dart';
import 'package:example/src/screen/views/third_view/third_view_model.dart';
import 'package:example/src/screen/views/third_view/third_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewProviders {
  static final mainTabVIewProvider =
      NotifierProvider<MainTabNotifier, int>(MainTabNotifier.new);

  static final firstViewModelProvider =
      AutoDisposeNotifierProvider<FirstViewModel, FirstViewState>(
          FirstViewModel.new);

  static final secondViewModelProvider =
      NotifierProvider<SecondViewModel, SecondViewState>(SecondViewModel.new);

  static final thirdViewModelProvider =
      AutoDisposeNotifierProvider<ThirdViewModel, ThirdViewState>(
          ThirdViewModel.new);
}

class SettinfsProviders {
  static final routerProvider =
      Provider<SampleRouter>((ref) => SampleRouter(ref));
}

class RepositryProviders {
  static final sampleRepositryProvider = Provider<SampleRepositryImpl>((ref) {
    return SampleRepositryImpl();
  });
}

class UtilsProviders {
  static final streamCountProvider = StreamProvider<int>((ref) {
    return Stream<int>.periodic(const Duration(seconds: 1), (x) => x);
  });
}
