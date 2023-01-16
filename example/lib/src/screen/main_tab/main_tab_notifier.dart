import 'package:example/src/screen/views/first_view/first_view.dart';
import 'package:example/src/screen/views/second_view/second_view.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_builder/view_model/src/base_view_model.dart';

class MainTabNotifier extends KeepBaseViewModel<int> {
  @override
  int get instanse => 0;

  final Map<IconData, Widget> tabs = {
    Icons.first_page: const FirstView(),
    Icons.security_outlined: const SecondView()
  };

  // tab index
  int get currentIndex => state;

  void onSelect(int value) {
    state = value;
  }
}
