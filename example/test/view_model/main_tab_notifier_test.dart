import 'package:example/src/common/providers/providers.dart';
import 'package:example/src/screen/main_tab/main_tab_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late MainTabNotifier target;
  final container = ProviderContainer();
  setUp(() {
    final prov = ViewProviders.mainTabVIewProvider;
    target = container.read(prov.notifier);
  });
  test("current index test", () {
    const int selectindex = 2;
    expect(target.currentIndex, 0);
    target.onSelect(selectindex);
    expect(target.currentIndex, selectindex);
  });
}
