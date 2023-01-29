import 'dart:math';

import 'package:example/src/common/providers/providers.dart';
import 'package:example/src/screen/views/first_view/first_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common_methods.dart';

void main() {
  late FirstViewModel firstVM;
  ProviderContainer container = ProviderContainer();

  setUp(
    () {
      final prov = ViewProviders.firstViewModelProvider;
      container = ProviderContainer();
      firstVM = container.read(prov.notifier);
    },
  );

  test(
    "add count test",
    () {
      expect(firstVM.count, 0);

      final int loopCount = Random().nextInt(10);

      loopMethods(loopCount, () {
        firstVM.addCount();
      });

      expect(firstVM.count, loopCount);
    },
  );

  test(
    "refresh Secound View Model",
    () {
      final secondVM =
          container.read(ViewProviders.secondViewModelProvider.notifier);
      expect(secondVM.list.length, 0);

      final int loopCount = Random().nextInt(10);

      loopMethods(loopCount, () {
        secondVM.addList("sample");
      });

      expect(secondVM.list.length, loopCount);

      firstVM.refreshSecoundViewModel();
      expect(secondVM.list.length, 0);
    },
  );
}
