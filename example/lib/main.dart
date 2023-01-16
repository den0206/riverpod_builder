import 'package:example/src/screen/main_tab/main_tab_view.dart';
import 'package:example/src/screen/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MainTabScreen.routeName,
      onGenerateRoute: SampleRouter.generateRoute,
    );
  }
}
