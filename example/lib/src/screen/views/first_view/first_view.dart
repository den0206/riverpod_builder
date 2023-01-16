import 'package:example/src/common/providers/providers.dart';
import 'package:example/src/screen/views/third_view/third_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:riverpod_builder/builder/builder.dart';

class FirstView extends StatelessWidget {
  static const routeName = '/';
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return RiverpodBuilder(
      provider: ViewProviders.firstViewModelProvider,
      builder: (context, ref, vm, state, reader) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('First View'),
            automaticallyImplyLeading: false,
          ),
          body: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(20),
                const Text(
                  "This View is Auto Dispose",
                ),
                const Gap(20),
                AreaContainer(
                  children: [
                    Text("${vm.count}"),
                    ElevatedButton(
                      child: const Text("ADD"),
                      onPressed: () {
                        reader.addCount();
                      },
                    ),
                  ],
                ),
                AreaContainer(
                  children: [
                    const Text("Stream Count"),
                    Text(vm.streamCount?.toString() ?? ""),
                    const Gap(10),
                    ElevatedButton(
                      child: const Text("refresh Stream Count"),
                      onPressed: () {
                        reader.refreshStreamCount();
                      },
                    )
                  ],
                ),
                AreaContainer(
                  children: [
                    Text(
                        "Second View List Length is ${vm.secondVM.list.length}"),
                    const Gap(10),
                    ElevatedButton(
                      child: const Text("refresh Secound View Model"),
                      onPressed: () {
                        reader.refreshSecoundViewModel();
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text("Push Third View"),
                  onPressed: () {
                    Navigator.of(context).pushNamed(ThirdView.routeName);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AreaContainer extends StatelessWidget {
  const AreaContainer({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.red),
      ),
      child: Column(
        children: children,
      ),
    );
  }
}
