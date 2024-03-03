import 'package:example/src/common/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:riverpod_builder/builder/builder.dart';

class ThirdView extends StatelessWidget {
  static const routeName = '/third';
  const ThirdView({super.key});

  @override
  Widget build(BuildContext context) {
    return RiverpodBuilder(
      provider: ViewProviders.thirdViewModelProvider,
      builder: (context, ref, vm, state, reader) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Title'),
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () async {
                await reader.popPage();
                if (context.mounted) Navigator.of(context).pop();
              },
            ),
          ),
          body: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(20),
                const Text(
                  "This View Is Auto Dispose",
                ),
                const Gap(20),
                Text(vm.textValue),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 18),
                  child: TextField(
                    decoration: const InputDecoration(hintText: "Enter Text"),
                    controller: vm.txtController,
                  ),
                ),
                ElevatedButton(
                  child: const Text("Update Value"),
                  onPressed: () {
                    reader.updateValue();
                    if (context.mounted) {
                      reader.dismissKeyboard();
                    }
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
