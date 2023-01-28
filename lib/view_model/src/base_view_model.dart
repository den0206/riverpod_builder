import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_builder/builder/builder.dart';
import 'package:riverpod_builder/log/src/color_log.dart';

/// We recommend defining a ViewModel(notifier) inheriting from this class.
///
/// This ViewModel is adapted from [RiverpodBuilder] ([AutoDisposeNotifier]).
///
/// It is suitable for adoption when **auto dispose of Notifier is desired**.
abstract class BaseViewModel<S> extends AutoDisposeNotifier<S>
    with InnerViewModel<S> {
  @override
  NotifierProviderRef<S> get providerRef => ref;

  @override
  S build() {
    return instanse;
  }

  @override
  void onDispose() {
    super.onDispose();
    ref.invalidateSelf();
  }
}

/// We recommend defining a ViewModel(notifier) inheriting from this class.
///
/// This ViewModel is adapted from [KeepRiverpodBuilder] ([Notifier]).
///
/// It is suitable for adoption when **auto dispose of Notifier is not desired**.
abstract class KeepBaseViewModel<S> extends Notifier<S> with InnerViewModel<S> {
  @override
  NotifierProviderRef<S> get providerRef => ref;

  bool isInit = false;

  @override
  S build() {
    ref.onDispose(() {
      onDispose();
    });
    return instanse;
  }

  @override
  void onInit() {
    super.onInit();
    isInit = true;
  }

  @override
  void onDispose() {
    super.onDispose();
    isInit = false;
  }
}

/// This class is the base of [BaseViewModel] and [KeepBaseViewModel].
///
///If you want to add common functions included in BaseVM(Notifier) above,
///
///please extension this class.
abstract class InnerViewModel<S> {
  abstract final S instanse;
  abstract final NotifierProviderRef<S> providerRef;
  late WidgetRef widgetRef;
  late BuildContext context;

  bool showLog = true;

  @mustCallSuper
  //ignore: no-empty-block
  void onInit() {
    if (showLog) logSuccess("Init $runtimeType");
  }

  @mustCallSuper
  //ignore: no-empty-block
  void onDispose() {
    if (showLog) logInfo("Dispose $runtimeType");
  }

  void refreshProvider(ProviderBase<Object?> provider) {
    if (providerRef.exists(provider)) {
      providerRef.invalidate(provider);
    }
  }
}
