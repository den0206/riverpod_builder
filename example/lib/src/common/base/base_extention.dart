import 'package:example/src/common/widget/overlay_loading_view.dart';
import 'package:riverpod_builder/view_model/src/base_view_model.dart';

extension InnerViewModelEXT on InnerViewModel {
  bool get isLoading => providerRef.read(OverlayLoadingView.provider);
  void showLoading() {
    providerRef.read(OverlayLoadingView.provider.notifier).show();
  }

  void hideLoading() {
    providerRef.read(OverlayLoadingView.provider.notifier).hide();
  }
}
