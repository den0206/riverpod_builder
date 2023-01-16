
※ (optional) if you use package Freezed excute following command.

```
flutter pub run build_runner build --delete-conflicting-outputs
```

This is a minimal sample.  
If you want to know more details, please check `example` folder.

```dart
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Builder Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstView(),
    );
  }
}

/// MARK define view state (use ① or ②)
// (A value whose value may change in the view.)

// ① page state without Freezed
class FirstViewState {
  FirstViewState({
    this.count = 0,
  });
  final int count;

  FirstViewState copyWith({
    int? count,
  }) {
    return FirstViewState(
      count: count ?? this.count,
    );
  }
}

// ② page state with Freezed
@freezed
class FirstViewStateWithFreezed with _$FirstViewStateWithFreezed {
  const factory FirstViewStateWithFreezed({
    @Default(0) int count,
  }) = _FirstViewStateWithFreezed;
  factory FirstViewStateWithFreezed.fromJson(Map<String, dynamic> json) => _$FirstViewStateWithFreezedFromJson(json);
}


/// MARK define view model
/// extends BaseViewModel(type auto dispose)

class FirstViewModel extends BaseViewModel<FirstViewState> {
  @override
  FirstViewState get instanse => FirstViewState();

  int get count => state.count;

  
  @override
  void onInit() async {
    // triger init this model
    // Asynchronous processing is also possible .
    await Future.delayed(const Duration(seconds: 1));
    super.onInit();
  }

  
  @override
  void onDispose() {
    // triger close this model
    super.onDispose();
  }

  void addCount() {
    // update count
    state = state.copyWith(count: state.count + 1);
  }
}

/// MARK define provider

final firstViewModelProvider =
    AutoDisposeNotifierProvider<FirstViewModel, FirstViewState>(
        FirstViewModel.new);

/// MARK define View

class FirstView extends StatelessWidget {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First View'),
      ),
      // wrap this package
      body: RiverpodBuilder(
        provider: firstViewModelProvider,
        builder: (context, ref, vm, state, reader) {
          return SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${vm.count}"),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text("Add Count"),
                  onPressed: () {
                    reader.addCount();
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

```