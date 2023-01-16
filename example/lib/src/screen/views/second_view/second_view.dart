import 'package:example/src/common/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:riverpod_builder/builder/builder.dart';

class SecondView extends StatelessWidget {
  static const routeName = '/second';
  const SecondView({super.key});

  @override
  Widget build(BuildContext context) {
    return KeepRiverpodBuilder(
      provider: ViewProviders.secondViewModelProvider,
      builder: (context, ref, vm, _, read) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Second View"),
          ),
          body: Column(
            children: [
              const Gap(20),
              const Text(
                "This View is Not Auto Dispose\nUnless you make it disappear state manually",
                style: TextStyle(color: Colors.red),
              ),
              const Gap(20),
              Expanded(
                child: ListView.builder(
                  itemCount: vm.list.length,
                  itemBuilder: (BuildContext context, int index) {
                    final value = vm.list[index];
                    return ListTile(
                      title: Text(value),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    child: const Text("ADD"),
                    onPressed: () {
                      read.addList("Sample");
                    },
                  ),
                  ElevatedButton(
                    child: const Text("Remove"),
                    onPressed: () {
                      read.removeList();
                    },
                  ),
                ],
              ),
              const Gap(20),
            ],
          ),
        );
      },
    );
  }
}
