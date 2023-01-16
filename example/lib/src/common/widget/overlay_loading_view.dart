import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OverlayLoadingNotifier extends AutoDisposeNotifier<bool> {
  @override
  bool build() => false;

  /// ローディングを表示する
  void show() => state = true;

  /// ローディングを非表示にする
  void hide() => state = false;
}

class OverlayLoadingView extends StatelessWidget {
  static final provider =
      AutoDisposeNotifierProvider<OverlayLoadingNotifier, bool>(
          OverlayLoadingNotifier.new);

  const OverlayLoadingView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        _loading(),
      ],
    );
  }

  Widget _loading() {
    return Consumer(builder: (context, ref, _) {
      final isLoading = ref.watch(provider);

      return isLoading ? _showLoading() : const SizedBox();
    });
  }

  Widget _showLoading() {
    return const ColoredBox(
      color: Colors.black26,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
