import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_builder/view_model/src/base_view_model.dart';

class RiverpodBuilder<T extends BaseViewModel<S>, S>
    extends ConsumerStatefulWidget {
  const RiverpodBuilder({
    super.key,
    required this.provider,
    required this.builder,
  });

  final Widget Function(
      BuildContext context, WidgetRef ref, T vm, S state, T reader) builder;

  final AutoDisposeNotifierProvider<T, S> provider;

  @override
  ConsumerState<RiverpodBuilder> createState() => _RiverpodBuilderState<T, S>();
}

class _RiverpodBuilderState<T extends BaseViewModel<S>, S>
    extends ConsumerState<RiverpodBuilder<T, S>> {
  bool isInit = false;

  @override
  void initState() {
    super.initState();

    if (!isInit) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // 初期化
        ref.read(widget.provider.notifier).onInit();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();

    // 強制破棄
    ref.watch(widget.provider.notifier).onDispose();
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
