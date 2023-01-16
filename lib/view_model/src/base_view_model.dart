import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_builder/log/color_log';

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

abstract class InnerViewModel<S> {
  abstract final S instanse;
  abstract final NotifierProviderRef<S> providerRef;
  late WidgetRef widgetRef;
  late BuildContext context;

  @mustCallSuper
  //ignore: no-empty-block
  void onInit() {
    logSuccess("Init $runtimeType");
  }

  @mustCallSuper
  //ignore: no-empty-block
  void onDispose() {
    logInfo("Dispose $runtimeType");
  }
}
