import 'dart:math';

import 'package:example/src/common/providers/providers.dart';
import 'package:example/src/screen/views/second_view/second_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common_methods.dart';

void main() {
  late SecondViewModel secondVM;
  ProviderContainer container = ProviderContainer();

  setUp(
    () {
      final prov = ViewProviders.secondViewModelProvider;
      secondVM = container.read(prov.notifier);
    },
  );
  group(
    "List Methods",
    () {
      test(
        "add List test",
        () async {
          expect(secondVM.list.length, 0);

          await secondVM.initList();
          final initCount = secondVM.list.length;
          expect(secondVM.list.length, initCount);

          final loopCount = Random().nextInt(10);
          loopMethods(
            loopCount,
            () {
              secondVM.addList("sample");
            },
          );

          expect(secondVM.list.length, initCount + loopCount);

          // 初期化
          secondVM.ref.invalidateSelf();
        },
      );

      test(
        "removeList",
        () async {
          expect(secondVM.list.length, 0);

          await secondVM.initList();
          final initCount = secondVM.list.length;
          expect(secondVM.list.length, initCount);
          final loopCount = Random().nextInt(initCount);

          loopMethods(
            loopCount,
            () {
              secondVM.removeList();
            },
          );

          expect(secondVM.list.length, initCount - loopCount);

          // 初期化
          secondVM.ref.invalidateSelf();
        },
      );
    },
  );
}
