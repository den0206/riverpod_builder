import 'package:example/src/screen/main_tab/main_tab_view.dart';
import 'package:example/src/screen/views/first_view/first_view.dart';
import 'package:example/src/screen/views/second_view/second_view.dart';
import 'package:example/src/screen/views/third_view/third_view.dart';
import 'package:flutter/material.dart';

class SampleRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainTabScreen.routeName:
        return MaterialPageRoute(builder: (_) => const MainTabScreen());
      case FirstView.routeName:
        return MaterialPageRoute(builder: (_) => const FirstView());
      case SecondView.routeName:
        return MaterialPageRoute(builder: (_) => const SecondView());
      case ThirdView.routeName:
        return MaterialPageRoute(builder: (_) => const ThirdView());
      default:
        return MaterialPageRoute(
            builder: (_) => const Center(
                  child: Text("Undefined"),
                ));
    }
  }
}
