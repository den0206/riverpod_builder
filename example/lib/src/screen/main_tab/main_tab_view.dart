import 'package:example/src/common/providers/providers.dart';
import 'package:example/src/common/widget/overlay_loading_view.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_builder/builder/builder.dart';

class MainTabScreen extends StatelessWidget {
  static const routeName = '/main_tab';
  const MainTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlayLoadingView(
      child: KeepRiverpodBuilder(
        provider: ViewProviders.mainTabVIewProvider,
        builder: (context, ref, vm, _, reader) {
          return Scaffold(
            body: vm.tabs.values.toList()[vm.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: reader.onSelect,
              currentIndex: vm.currentIndex,
              items: vm.tabs.keys
                  .map((e) => BottomNavigationBarItem(icon: Icon(e), label: ""))
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
