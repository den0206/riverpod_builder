import 'package:example/src/common/providers/providers.dart';
import 'package:example/src/screen/views/third_view/third_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ThirdViewModel thirdVM;
  ProviderContainer container = ProviderContainer();

  setUp(
    () {
      final prov = ViewProviders.thirdViewModelProvider;
      thirdVM = container.read(prov.notifier);
    },
  );

  test(
    "Input TextValue",
    () {
      expect(thirdVM.textValue, "");
      const value = "sample";
      thirdVM.txtController.text = value;
      thirdVM.updateValue();
      expect(thirdVM.textValue, value);
    },
  );
}
