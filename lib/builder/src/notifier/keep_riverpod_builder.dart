import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_builder/view_model/src/base_view_model.dart';

/// This Builder is adapted from [KeepBaseViewModel] ([Notifier]).
///
/// It is suitable for adoption when **auto dispose of Notifier is not desired**.
class KeepRiverpodBuilder<T extends KeepBaseViewModel<S>, S>
    extends ConsumerStatefulWidget {
  const KeepRiverpodBuilder({
    super.key,
    required this.provider,
    required this.builder,
    this.showLog = true,
  });

  final Widget Function(
      BuildContext context, WidgetRef ref, T vm, S state, T reader) builder;

  final NotifierProvider<T, S> provider;

  final bool showLog;

  @override
  ConsumerState<KeepRiverpodBuilder> createState() =>
      _KeepRiverpodBuilder<T, S>();
}

/// [KeepRiverpodBuilder] state.
class _KeepRiverpodBuilder<T extends KeepBaseViewModel<S>, S>
    extends ConsumerState<KeepRiverpodBuilder<T, S>> {
  @override
  void initState() {
    super.initState();
    bool isInit = ref.read(widget.provider.notifier).isInit;

    if (!isInit) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!widget.showLog)
          ref.read(widget.provider.notifier).showLog = widget.showLog;

        // 初期化
        ref.read(widget.provider.notifier).onInit();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(widget.provider.notifier);
    final state = ref.watch(widget.provider);
    final reader = ref.read(widget.provider.notifier);
    ref.read(widget.provider.notifier).widgetRef = ref;
    ref.read(widget.provider.notifier).context = context;

    return widget.builder(
      context,
      ref,
      vm,
      state,
      reader,
    );
  }
}
